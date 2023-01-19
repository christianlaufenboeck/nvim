vim.g.mapleader = " "

local keymap = vim.keymap

-- center cursor and move screen 1/2 page up or down
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- easily move selected lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- remap escape key
keymap.set("i", "jk", "<ESC>")

-- clear search results / turn off highlighting until next search
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete current selection without adding to registry
keymap.set("v", "D", '"_d')

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- add new vertical pane to the right
keymap.set("n", "<leader>sv", "<C-w>v")

-- close current split pane / window
keymap.set("n", "<leader>sx", ":close<CR>")

-- move to next pane
keymap.set("n", "<leader>sp", "<C-w>h")

-- move to previous pane
keymap.set("n", "<leader>sn", "<C-w>l")

-- toggle maximizing a split pane
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- toggle nvim tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- focus nvim tree
keymap.set("n", "<leader>ef", ":NvimTreeFocus<CR>")

-- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")

-- find string in current working directory as you type
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")

-- find string under cursor in current working directory
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")

-- list open buffers in current neovim instance
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")

-- list available help tags
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
