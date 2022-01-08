-- local cmd = vim.api.nvim_command
local cmd = vim.cmd
cmd([[
  augroup FormatOnSave
    autocmd!
    " so when it saves it stays saved
    autocmd BufWritePre *.{js,java,cpp,haskell,json,ts,rs,go,html,svelte,vue,python,hs,sh} :lua vim.lsp.buf.formatting_sync()
  augroup END
]])

cmd([[
    augroup ReloadNvimConfig
        autocmd BufWritePost *.{lua,vim} source %
    augroup END
]])

require("config.automation.packer")
-- cmd([[
--     augroup LspConfig
--         autocmd!
--         autocmd! BufWrite,BufEnter,InsertLeave * :lua vim.diagnostic.setloclist({open=false})
--     augroup END
-- ]])
