local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- see https://github.com/nvim-tree/nvim-tree.lua#setup
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "",
					arrow_open = "",
				},
			},
		},
	},
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},
	git = {
		enable = true,
		timeout = 400, -- (in ms)
	},
})
