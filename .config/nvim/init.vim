noremap n j
noremap e k
noremap j e
noremap l i
noremap i l
noremap k n
noremap K N
noremap N J
vnoremap L I
noremap <c-w>i <c-w>l
noremap <c-w>n <c-w>j
noremap <c-w>e <c-w>k
nnoremap <leader>wi <c-w>l
nnoremap <leader>wh <c-w>h
nnoremap <leader>we <c-w>k
nnoremap <leader>wn <c-w>j
nnoremap <leader>wt <c-w>t
noremap  <leader>wE <c-w>K

"to install python3 in checkhelath
"python3 -m pip install --user --upgrade pynvim

setlocal spell
"set spelllang=en_us
set spelllang=es

" no plugin
let mapleader = " "
syntax on
set noerrorbells
set ignorecase 
set smartcase 
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
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
"Plug 'honza/vim-snippets'
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim' "this is for latex equations
Plug 'dylanaraps/wal'
"Plug 'https://github.com/sonph/onehalf', {'rtp': 'vim/'}
"Plug 'https://github.com/dracula/vim', {'as': 'dracula'}
"need both
call plug#end()

" Theme
"colorscheme onehalfdark
"colorscheme dracula
colorscheme gruvbox
"colorscheme wal
"set background=dark
	"for transparent
hi Normal guibg=NONE ctermbg=NONE

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

" auto compile suckless programs
    autocmd BufWritePost config.h,config.def.h !sudo make clean install

" auto compile xresources
    autocmd BufWritePost *.Xresources !xrdb ~/.Xresources

" auto compile sxhkd
    autocmd BufWritePost *sxhkdrc !pkill sxhkd; setsid sxhkd &

" auto shortcuts 
    autocmd BufWritePost,TextChanged sf,sd !$HOME/.local/bin/Utilities/shortcut_maker

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

" ultisnips
let g:UltiSnipsExpandTrigger='<c-l>'
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

"tex conceal
set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none

