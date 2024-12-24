local lspconfig_status, lspconfig = pcall(require, 'lspconfig')
if not lspconfig_status then
    return
end

vim.diagnostic.config({
    virtual_text = {
        source = 'always',
        prefix = '▎', -- Could be '●', '▎'■, 'x'
    },
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
})

local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
lspconfig.clangd.setup({
    capabilities = capabilities,
    cmd = {
        'clangd',
        '--background-index',
        '--pch-storage=memory',
        '--all-scopes-completion',
        '--header-insertion=never',
        '--inlay-hints',
        '--header-insertion-decorators',
        '--function-arg-placeholders',
        '--completion-style=detailed',
    },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'h', 'hpp' },
    -- flags = 
    single_file_support = true,
    root_dir = lspconfig.util.root_pattern(
        'cmake',
        'src'
    ),
})

lspconfig.cmake.setup({
    capabilities = capabilities,
    filetypes = { 'cmake' },
    cmd = { 'cmake-language-server' },
    single_file_support = true,
    root_patern = lspconfig.util.root_pattern(
        'CMakePresets.json', 'CTestConfig.cmake', '.git', 'build/', 'cmake', 'CMakeLists.txt'
    ),
    init_options = {
        buildDirectory = 'build',
    },
})
