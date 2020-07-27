
" to make coc work with javascript install the coc-tsserver, and coc-css

noremap n j
noremap e k
noremap j e
noremap l i
noremap i l
noremap k n
noremap K N
noremap N J
vnoremap L I
let mapleader = " "
let maplocalleader = "\<Space>"
set updatetime=1500 " this is for autosave in tex files(every cursorhold event)
noremap <c-w>i <c-w>l
noremap <c-w>n <c-w>j
noremap <c-w>e <c-w>k
nnoremap <leader>wi <c-w>l
nnoremap <leader>wh <c-w>h
nnoremap <leader>we <c-w>k
nnoremap <leader>wn <c-w>j
nnoremap <leader>wt <c-w>t
noremap  <leader>wE <c-w>K
noremap  <leader>w- <c-w>-
noremap  <leader>w+ <c-w>+
noremap  <leader>ww :w<CR>
noremap  <F7> :set spell! \| set wrap<CR>

"to install python3 in checkhelath
"python3 -m pip install --user --upgrade pynvim
"pip3 install neovim-remote
"
"javascript
let g:indentLine_enabled = 0
" enable vertical lines in javascript and typescript files
autocmd BufReadPost,BufNewFile *.js,*.ts :IndentLinesToggle
autocmd VimEnter,WinEnter,BufNewFile,BufRead,BufEnter,TabEnter * IndentLinesReset
"setlocal spell
set spelllang=es
"set spelllang=en_us

" whichkey
set timeoutlen=500
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
syntax on
filetype plugin indent on
set noerrorbells
set ignorecase 
set smartcase 
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set noswapfile
set backup
set backupdir=~/.config/nvim/backups
set undodir=~/.config/nvim/undodir
"persistent undo
set undofile
set incsearch
set relativenumber
set laststatus=0
set cmdheight=1
set noshowmode
set clipboard=unnamedplus


"detect root in git repo
if executable('rg')
    let g:rg_derive_root='true'
endif

call plug#begin()

"CocInstall coc-marketplace
"CocList marketplace
"CocInstall coc-python and pip install jedi
"CocInstall coc-snippets 
"CocList marketplace texlab
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'  }
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
Plug 'https://github.com/mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex'
Plug 'scrooloose/syntastic'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim' "this is for latex equations
Plug 'preservim/nerdcommenter'
Plug 'liuchengxu/vim-which-key'
Plug 'dylanaraps/wal'
Plug 'junegunn/goyo.vim'
Plug 'neovimhaskell/haskell-vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'yggdroot/indentLine'
"Plug 'https://github.com/sonph/onehalf', {'rtp': 'vim/'}
"Plug 'https://github.com/dracula/vim', {'as': 'dracula'}
"need both
call plug#end()

" fix colors for highlighting spelling mistakes
autocmd ColorScheme gruvbox hi SpellBad cterm=reverse ctermfg=214 ctermbg=235 gui=reverse guifg=#fabd2f guibg=#282828

" Theme
"colorscheme onehalfdark
"colorscheme dracula
colorscheme gruvbox
"colorscheme wal
"set background=dark
"
"for transparent vim
hi Normal guibg=NONE ctermbg=NONE

" sets 24 bit term colors for vim
set termguicolors
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
		  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
		  \,sm:block-blinkwait175-blinkoff150-blinkon175

"if &term =~ "st-256color"
    " bright red in normal mode
    "let &t_SI = "\<Esc>[121m"
    "reset to normal for insert mode
    "let &t_EI = "\<Esc>[130m"
    " make sure it resets when you exit vim
    "autocmd VimLeave * silent !echo -ne "\033[130m"
"endif

"Cursor highlight groups
"Cursor CursorIM CursorColumn CursorLine


" airline
"let g:airline_theme='onehalfdark'
"let g:airline_theme='gruvbox'

" Keybindings
map <leader>r :!python3 %<cr>
map <F6> :e ~/.config/nvim/init.vim<cr>
map <F3> :e ~/.zshrc<cr>
map <C-&> <C-^>

""
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

" auto compile suckless programs
    autocmd BufWritePost config.h !cd $(compileSuckless %); sudo make clean install 

" auto compile latex if no vimtex
    autocmd BufWritePost,CursorHold,CursorHoldI *.tex :call CompileTex()

    function CompileTex()
        :w | silent exec "!latexmk -pdf %"
    endfunction


" auto compile vim
    autocmd BufWritePost *.vim source %

" auto compile xresources
    autocmd BufWritePost *.Xresources !xrdb ~/.Xresources

" auto compile sxhkd
    autocmd BufWritePost *sxhkdrc !pkill sxhkd; setsid sxhkd &

" auto shortcuts 
    autocmd BufWritePost,TextChanged sf,sd !$AUTOMATION/shortcut_maker

" functions
function Autosaving()
    autocmd TextChanged,TextChangedI <buffer> silent! write
endfunction

" UndoTreeToggle
map <leader>u :UndotreeToggle<CR>

" NERDTreeToggle
map <leader>se :NERDTreeToggle<CR>
let NERDTreeMenuUp   = 'e'
let NERDTreeMenuDown = 'n'
let NERDTreeMapOpenExpl = 'k'

" Undo tree
nnoremap <F5> :UndotreeToggle<cr>

" fzf
nnoremap <c-p> :PFiles<cr> 
nnoremap <leader>b :Buffers<cr> 
nnoremap <leader>gp :GFiles<cr> 
nnoremap <leader>gl :BCommits<cr> 
nnoremap <leader>f :Rg<cr>
nnoremap <F4> :Course<cr>
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'


" gives a preview window to Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" to start fzf at root of project
command! PFiles execute 'Files' s:find_current_root()

function! s:find_current_root()
    execute ':lcd %:p:h'
    return system('git status') =~ '^fatal:' ? 
                \ expand("%:p:h") : system("git rev-parse --show-toplevel 2> /dev/null")[:-2]
endfunction


" for ripgrep
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'dir': s:find_current_root()}), <bang>0)

"search in specific folder"
command! -bang Course call fzf#vim#files('~/Documents/Learn/languages', <bang>0)

"Or, if you want to override the command with different fzf options, just pass a custom spec to the function.
"command! -bang -nargs=? -complete=dir Files
"   \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline']}, <bang>0)

    
" GoTo code navigation.
"nmap <leader>gd <Plug>(coc-definition)
nmap gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart

" Sweet Sweet FuGITive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

" ultisnips
let g:UltiSnipsExpandTrigger='<c-l>' " TO USE SNIPPETS
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=["UltiSnips", "my_snippets"]

"Coc-snippets
"to scroll with tab
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'
"imap <C-l> <Plug>(coc-snippets-expand)


" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_mappings_enabled=1
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_toc_config = {
      \ 'name' : 'TOC',
      \ 'layers' : ['content', 'todo', 'include'],
      \ 'resize' : 1,
      \ 'split_width' : 50,
      \ 'todo_sorted' : 0,
      \ 'show_help' : 1,
      \ 'show_numbers' : 1,
      \ 'mode' : 2,
      \}

"tex conceal
set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none

" nerdcommenter
nnoremap gc :call NERDComment(0,"toggle")<CR>
vnoremap gc :call NERDComment(0,"toggle")<CR>

" Goyo

nnoremap <leader>gg :Goyo \| set wrap \| set linebreak<CR>
"nnoremap <leader>gd :Goyo! \| :set wrap! \| :set linebreak!<CR>


" Haskell-vim
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords
