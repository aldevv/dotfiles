noremap n j
noremap e k
noremap j e
noremap l i
noremap i l
noremap k n
noremap K N
noremap N J
noremap <c-w>i <c-w>l
noremap <c-w>n <c-w>j
noremap <c-w>e <c-w>k

"to install python3 in checkhelath
"python3 -m pip install --user --upgrade pynvim

" no plugin
let mapleader = " "
syntax on
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
"set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
"persistent undo
set undofile
set incsearch
set relativenumber
set laststatus=0
set cmdheight=1
set noshowmode
set clipboard=unnamedplus

" sets 24 bit term colors for vim
	if exists('+termguicolors')
  	 let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  	 let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  	 set termguicolors
	endif

"detect root in git repo
if executable('rg')
    let g:rg_derive_root='true'
endif

call plug#begin()

"CocInstall coc-marketplace
"CocList marketplace
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'  }
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
Plug 'https://github.com/mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'https://github.com/sonph/onehalf', {'rtp': 'vim/'}
"Plug 'https://github.com/dracula/vim', {'as': 'dracula'}
"need both
call plug#end()

" Theme
	"colorscheme onehalfdark
	"colorscheme dracula
colorscheme gruvbox
	"for transparent
hi Normal guibg=NONE ctermbg=NONE
	"let g:airline_theme='onehalfdark'
	"let g:airline_theme='gruvbox'

" Keybindings
map <leader>r :!python3 %<cr>
map <F6> :e ~/.config/nvim/init.vim<cr>
map <F3> :e ~/.zshrc<cr>
map <C-&> <C-^>
nnoremap <leader>w <c-w>

" auto save if is a python file
autocmd BufReadPost *.py :call Autosaving()

" functions
function Autosaving()
    autocmd TextChanged,TextChangedI <buffer> silent write
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
    nnoremap <leader>p :Files<cr> 
    nnoremap <leader>gp :GFiles<cr> 

    
" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
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
