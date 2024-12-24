vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.nofsync = true

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- between windows
keymap('n', '<leader><Down>', '<C-W><C-J>', opts)
keymap('n', '<leader><Up>', '<C-W><C-K>', opts)
keymap('n', '<leader><Right>', '<C-W><C-L>', opts)
keymap('n', '<leader><Left>', '<C-W><C-H>', opts)

-- nvim-tree
keymap('n', 'fo', '<cmd>NvimTreeOpen<CR>', opts)
keymap('n', 'fq', '<cmd>NvimTreeClose<CR>', opts)
keymap('n', 'ff', '<cmd>NvimTreeFindFile<CR>', opts)

-- gitsigns
keymap('n', 'gp', '<cmd>Gitsigns preview_hunk_inline<CR>', opts)

-- barbar
keymap('n', '[b', '<cmd>BufferPrevious<CR>', opts)
keymap('n', ']b', '<cmd>BufferNext<CR>', opts)
keymap('n', '[q', '<cmd>BufferDelete<CR>', opts)
