-- local cmd = vim.api.nvim_command
local cmd = vim.cmd
cmd([[
  augroup FormatOnSave
    autocmd!
    " so when it saves it stays saved
    autocmd BufWritePre *.{js,java,cpp,haskell,json,ts,rs,go,html} :lua vim.lsp.buf.formatting_sync()
  augroup END
]])
