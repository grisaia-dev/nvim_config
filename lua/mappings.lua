vim.g.mapleader = ' '

local keymap = vim.api.nivm_set_keymap
local opts = { noremap = true, silent = true }

keymap('n', '<leader><Down>', '<C-W><C-J>', opts)
keymap('n', '<leader><Up>', '<C-W><C-K>', opts)
keymap('n', '<leader><Right>', '<C-W><C-L>', opts)
keymap('n', '<leader><Left>', '<C-W><C-H>', opts)
