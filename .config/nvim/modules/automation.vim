" Remove trailing whitespace on save
" auto save on focus lost
" au FocusLost * :wa
"
let ext = expand('%:e')
if ext != "vim"
   autocmd BufWritePre * %s/\s\+$//e
endif
" Vertically center document when entering insert mode
" autocmd InsertEnter * norm zz


"bufwritepost  is when you save them
"bufreadpost  is when you open them

" Utilities
" auto save if is a python file
   " autocmd BufReadPost *.py :call Autosaving()
   "
" commenting in python
"    autocmd FileType python     nnoremap <buffer> gcc I#<esc>

" commenting in c,cpp
"    autocmd FileType c,cpp     nnoremap <buffer> gcc I//<esc>

" auto compile status bar dwm
    autocmd BufWritePost dwmstatus :!killall dwmstatus; setsid dwmstatus &

" auto compile suckless programs MODIFY TO GET BORDER
    " autocmd BufWritePost config.h !cd $(compileSuckless %); sudo make clean install
    autocmd BufWritePost config.h :call CompileSuck()

    function CompileSuck()
        let path = expand('%:p:h')
        let name = system('basename '.shellescape(path))
        " exec 'echo '.shellescape(name)
        silent exec '!cd ' . shellescape(path)
        if name =~ "dwm-6.2"
            echo name
            :exec '!changeWallpaperKeepBorders'
        else
            :exec '!sudo make clean install'
        endif



    endfunction
" auto compile latex if no vimtex
    autocmd BufWritePost,CursorHold,CursorHoldI *.tex :silent call CompileTex()

" auto compile markdown
    autocmd BufWritePost *.md :silent call CompileMd()

    function CompileTex()
        :w | silent Dispatch! latexmk -pdf %
    endfunction

    function CompileMd()
        " the space at the end .pdf " is caused by the \n character
        let l:buffer = bufname()
        if l:buffer =~ '\v.*/?todo.md'
           return
        endif
        let file = expand('%:p')
         
        let destinationFile = system("printf \"$(basename ". file. " .md).pdf\"")
        let destinationPath = expand('%:p:h')
        let destination = destinationPath .'/'. destinationFile

        let run = system("compileMd ".file." ".destination)
        if v:shell_error == 0
            :exec "!setsid zathura " . shellescape(destination)
        endif
    endfunction

" auto compile vim
    autocmd BufWritePost *.vim source %

" auto compile xresources
    autocmd BufWritePost *.Xresources !xrdb -merge ~/.Xresources

" auto compile sxhkd
    autocmd BufWritePost *sxhkdrc :!killall -s SIGUSR1 sxhkd

" auto shortcuts
    autocmd BufWritePost,TextChanged sf,sd !$AUTOMATION/shortcut_maker_better

" functions
function Autosaving()
    autocmd TextChanged,TextChangedI <buffer> silent! write
endfunction

" needs neovim 0.5
augroup highlight_yank
   autocmd!
   autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" let maplocalleader = ','
augroup set_latex_env
   autocmd!
   autocmd FileType tex set spell! wrap spelllang=es
   "set local leader
   if g:extension == 'tex'
       let maplocalleader = ','
   endif
   
   autocmd FileType tex nnoremap <silent><localleader> :<c-u>WhichKey  ','<CR>

"======================
augroup END

augroup projectionist_env
   autocmd BufRead,BufNewFile .projection  set filetype=projection

augroup END

"automatic ctags
" au FileType {c,cpp} au BufWritePost <buffer> silent ! [ -e tags ] &&
"     \ ( awk -F'\t' '$2\!="%:gs/'/'\''/"{print}' tags ; ctags -f- '%:gs/'/'\''/' )
"     \ | sort -t$'\t' -k1,1 -o tags.new && mv tags.new tags
