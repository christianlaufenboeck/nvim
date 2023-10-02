local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
	return
end

local keymap = vim.keymap

local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- display definitions of variables, etc.
	keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", opts)

	-- go to declaration of function
	keymap.set("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)

	-- show definitions inline in overlay modal
	keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<CR>", opts)

	-- go to file / original implementation
	keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)

	-- show available code actions
	keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)

	-- smart rename
	keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)

	-- show diagnostics for line
	keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)

	-- show diagnostics for cursor
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)

	-- move between previous or next diagnostics in current buffer
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)

	-- display documentation for current cursor
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

	-- show outline on right hand side
	keymap.set("n", "<leader>o", "<cmd>LSoutlineToggle<CR>", opts)

	if client.name == "tsserver" then
		-- rename current file and update imports
		keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>")

		-- organize imports
		keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>")

		-- removed unused vars
		keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>")
	end
end

local capabilities = cmp_nvim_lsp.default_capabilities()

local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
})

lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

lspconfig["emmet_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})
