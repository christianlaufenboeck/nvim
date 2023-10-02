local setup, null_ls = pcall(require, "null-ls")
if not setup then
 	return
 end

-- formatting on save
 local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

 null_ls.setup({
 	sources = {
 		null_ls.builtins.formatting.prettier.with({
 			dynamic_command = function()
 				return "prettier"
 			end,
 		}),
 		null_ls.builtins.formatting.stylua,
 		null_ls.builtins.diagnostics.eslint_d.with({
 			command = "eslint_d",
 		}),
 	},

 	-- format on save configuration
 	on_attach = function(current_client, bufnr)
 		if current_client.supports_method("textDocument/formatting") then
 			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
 			vim.api.nvim_create_autocmd("BufWritePre", {
 				group = augroup,
 				buffer = bufnr,
 				callback = function()
 					vim.lsp.buf.format({
 						filter = function(client)
 							return client.name == "null-ls"
 						end,
 						bufnr = bufnr,
 					})
 				end,
 			})
 		end
 	end,
 })
