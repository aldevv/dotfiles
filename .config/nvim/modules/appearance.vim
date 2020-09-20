
" fix colors for highlighting spelling mistakes
autocmd ColorScheme gruvbox hi SpellBad cterm=reverse ctermfg=214 ctermbg=235 gui=reverse guifg=#fabd2f guibg=#282828

" Theme
"colorscheme onehalfdark
"colorscheme dracula
" set background=dark
colorscheme gruvbox
"deletes the signcolumn background
" highlight clear LineNr
" highlight CursorLineNr guifg=#050505
highlight clear SignColumn
highlight clear CursorLineNr
" set cursorline
" set cursorcolumn
"
"options for column line number color
highlight CursorLineNr ctermbg=yellow cterm=bold guifg=#fabd2f guibg=NONE
" highlight CursorLineNr ctermbg=yellow cterm=bold guifg=#fabd2f guibg=#2b2b2b
" highlight CursorLine ctermbg=yellow cterm=bold guibg=#2b2b2b

"try codedark
" colorscheme wal
"
"for transparent vim
hi Normal guibg=NONE ctermbg=NONE

" sets 24 bit term colors for vim
set termguicolors

"Cursor highlight groups
"Cursor CursorIM CursorColumn CursorLine


" airline
"let g:airline_theme='onehalfdark'
"let g:airline_theme='gruvbox'
"show buffers active on top
"let g:airline#extensions#tabline#enabled = 1
"
"
"Themes
"https://github.com/vim-airline/vim-airline/wiki/Screenshots
"
let g:airline_theme='luna'
let g:airline_powerline_fonts = 1
"https://ncona.com/2019/02/the-vim-statusline/
