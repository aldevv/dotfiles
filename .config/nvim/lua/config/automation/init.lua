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
--

-- so far is working
-- cmd('autocmd BufReadPre *.{html,css,js,jsx,ts} EmmetInstall')

-- cmd('autocmd Filetype tex let b:AutoPairs = {"(": ")", "[": "]"}')
cmd('autocmd VimEnter,WinEnter,BufNewFile,BufRead,BufEnter,TabEnter *.{vim,jsx,json,ts,js,svelte,vue} :IndentLinesToggle')

cmd([[
    augroup NetrwSettings
        autocmd!
        autocmd FileType netrw nnoremap ? :help netrw-quickmap<CR>
        autocmd BufEnter * if &ft != "netrw" | execute 'silent! nunmap ?' | endif
    augroup END
]])
