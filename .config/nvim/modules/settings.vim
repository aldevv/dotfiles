syntax enable
" disable compatibility to vi, to activate vim improvements
set nocompatible
set shell=/bin/zsh
let mapleader = " "
"======================
"set local leader
autocmd FileType tex let maplocalleader=','
autocmd FileType tex nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
"======================
set updatetime=1500 " this is for autosave in tex files(every cursorhold event)
set encoding=utf-8
scriptencoding utf-8

"setlocal spell
" set spelllang=es
set spelllang=en_us
"set spelllang=en_us

" whichkey
" set timeoutlen=1500
set timeoutlen=700
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
" nnoremap <silent> <leader><space>   :<c-u>WhichKey '<leader><leader>'<CR>
filetype plugin indent on
" set signcolumn=yes
" set foldmethod=indent

let &t_8f = '\<esc>[38;2;%lu;%lu;%lum'
let &t_8b = '\<esc>[48;2;%lu;%lu;%lum'
set textwidth=95
set foldmethod=manual
set splitbelow
" set foldcolumn=1
set wildmode=longest,list,full
set expandtab "makes tab work as spaces
set noerrorbells
set ignorecase
set smartcase
set tabstop=4 softtabstop=4
set shiftwidth=4

set smartindent
set nowrap
set noswapfile
set backup
set backupdir=~/.config/nvim/backups
set undodir=~/.config/nvim/undodir
set autoindent
"persistent undo
set undofile
set incsearch
set relativenumber
set laststatus=0
set cmdheight=1
" to  select and move cursor
set mouse=a
" to show stuff under the modeline
set noshowmode
" change buffers without saving
set hidden
" ask to save when not saved
set confirm


"detect root in git repo
if executable('rg')
    let g:rg_derive_root='true'
endif

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
" let g:python_highlight_all = 1
" if exists("python_highlight_all")
"   let python_space_error_highlight = 1
"  endif
let g:termdebug_popup = 0
let g:termdebug_wide = 163

" share registers between vim instances
augroup SHADA
    autocmd!
    autocmd CursorHold,TextYankPost,FocusGained,FocusLost *
                \ if exists(':rshada') | rshada | wshada | endif
augroup END
