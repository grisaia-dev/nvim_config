local opt = vim.opt

-- line numbers
opt.number = true
opt.relativenumber = true

opt.guicursor = 'n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50'

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search setting
opt.ignorecase = true
opt.smartcase = true

-- cursore line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = 'dark'
opt.signcolumn = 'yes'

-- scroll
opt.scrolloff = 10
opt.sidescrolloff = 10

-- backspace
opt.backspace = 'indent,eol,start'

-- cmp
opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- clipboard
local uname = vim.loop.os_uname()
_G.OS = uname.sysname
_G.IS_MAC = OS == 'Darwin'
_G.IS_LINUX = OS == 'Linux'
_G.IS_WINDOWS = OS:find 'Windows' and true or false
_G.IS_WSL = IS_LINUX and uname.release:find 'Microsoft' and true or false

if _G.IS_WINDOWS then
    opt.clipboard:append('unnamedplus')
end

if _G.IS_MAC then
    opt.clipboard:append('unnamedplus')
end

-- split windows
opt.splitright = true
opt.fileencoding = 'utf-8'

opt.swapfile = false
opt.backup = false

-- return to last edit position
vim.api.nvim_create_autocmd('BufReadPost', {
    pattern = '*',
    callback = function()
        if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.cmd("normal! g`\"")
        end
    end
})
