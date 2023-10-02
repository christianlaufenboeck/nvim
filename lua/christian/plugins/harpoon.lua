local harpoon = require("harpoon")

harpoon.setup({})

local keymap = vim.api.nvim_set_keymap

-- Add a file to Harpoon
keymap("n", "<leader>ha", ':lua require("harpoon.mark").add_file()<CR>', { noremap = true, silent = true })

-- Toggle the menu
keymap("n", "<leader>hm", ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { noremap = true, silent = true })

-- Open files form certain slots
keymap("n", "<leader>h1", ':lua require("harpoon.ui").nav_file(1)<CR>', { noremap = true, silent = true })
keymap("n", "<leader>h2", ':lua require("harpoon.ui").nav_file(2)<CR>', { noremap = true, silent = true })
keymap("n", "<leader>h3", ':lua require("harpoon.ui").nav_file(3)<CR>', { noremap = true, silent = true })
