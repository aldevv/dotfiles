call plug#begin()

"
"
 Plug 'morhetz/gruvbox'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'  }
 Plug 'https://github.com/vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'https://github.com/mbbill/undotree'
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'tpope/vim-repeat'
 Plug 'junegunn/fzf.vim'
 Plug 'lervag/vimtex'
 Plug 'scrooloose/syntastic'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 Plug 'KeitaNakamura/tex-conceal.vim' "this is for latex equations
 Plug 'tpope/vim-commentary'
 Plug 'liuchengxu/vim-which-key'
 Plug 'junegunn/goyo.vim'
 Plug 'neovimhaskell/haskell-vim'
 Plug 'yuezk/vim-js'
 Plug 'maxmellon/vim-jsx-pretty'
 Plug 'yggdroot/indentLine'
 Plug 'prettier/vim-prettier', {
   \ 'do': 'npm install',
   \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
 Plug 'tpope/vim-surround'
 Plug 'easymotion/vim-easymotion'
 Plug 'ryanoasis/vim-devicons'
 Plug 'vwxyutarooo/nerdtree-devicons-syntax'

"to learn
"
"
 "Plug 'dylanaraps/wal'
 "close html and jsx tags
Plug  'alvan/vim-closetag'

"    gS to split a one-liner into multiple lines
"    gJ (with the cursor on the first line of a block) to join a block into a single-line statement.
Plug 'AndrewRadev/splitjoin.vim'
" good guide for dev nvim
"https://hanspinckaers.com/posts/2020/01/vim-python-ide/
"https://github.com/wellle/targets.vim
" goooooooooood!!, more text objects!!
Plug 'wellle/targets.vim'

"
"
"
" for c++
"Plug 'preservim/tagbar'
"Plug ‘ludovicchabant/vim-gutentags’
"Plug 'https://github.com/sonph/onehalf', {'rtp': 'vim/'}
"Plug 'https://github.com/dracula/vim', {'as': 'dracula'}
"need both
call plug#end()
