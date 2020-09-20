syntax enable
set shell=/bin/bash
let mapleader = " "
let maplocalleader = ','
set updatetime=1500 " this is for autosave in tex files(every cursorhold event)
set encoding=utf-8
scriptencoding utf-8

"setlocal spell
" set spelllang=es
set spelllang=en_us
"set spelllang=en_us

" whichkey
set timeoutlen=1500
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
filetype plugin indent on
" set signcolumn=yes
" set foldmethod=indent
set foldmethod=manual
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
set noshowmode
set clipboard=unnamedplus
" to  select and move cursor
set mouse=a


"detect root in git repo
if executable('rg')
    let g:rg_derive_root='true'
endif

