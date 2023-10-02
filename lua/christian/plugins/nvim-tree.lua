local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- see https://github.com/nvim-tree/nvim-tree.lua#setup
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

local HEIGHT_RATIO = 0.8 -- You can change this
local WIDTH_RATIO = 0.5 -- You can change this too

-- local gwidth = vim.api.nvim_list_uis()[1].width
-- local gheight = vim.api.nvim_list_uis()[1].height
-- local width = 60
-- local height = 20

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
	view = {
		relativenumber = true,
		float = {
			enable = true,
			open_win_config = function()
				local screen_w = vim.opt.columns:get()
				local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
				local window_w = screen_w * WIDTH_RATIO
				local window_h = screen_h * HEIGHT_RATIO
				local window_w_int = math.floor(window_w)
				local window_h_int = math.floor(window_h)
				local center_x = (screen_w - window_w) / 2
				local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
				return {
					border = "rounded",
					relative = "editor",
					row = center_y,
					col = center_x,
					width = window_w_int,
					height = window_h_int,
				}
			end,
		},
		width = function()
			return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
		end,
	},
	-- view = {
	-- 	width = width,
	-- 	height = height,
	-- 	float = {
	-- 		enable = true,
	-- 		open_win_config = {
	-- 			relative = "editor",
	-- 			width = width,
	-- 			height = height,
	-- 			row = (gheight - height) * 0.4,
	-- 			col = (gwidth - width) * 0.5,
	-- 		},
	-- 	},
	-- },
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
