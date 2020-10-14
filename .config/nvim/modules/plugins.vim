call plug#begin()

"
" themes
 Plug 'morhetz/gruvbox'
 Plug 'fcpg/vim-fahrenheit'
 Plug 'tomasiser/vim-code-dark'
 Plug 'dracula/vim'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 " programming
 Plug 'sheerun/vim-polyglot'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'scrooloose/syntastic'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 Plug 'tpope/vim-commentary'
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'junegunn/fzf.vim'
 Plug 'yggdroot/indentLine'
 Plug 'prettier/vim-prettier', {
   \ 'do': 'npm install',
   \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
 Plug 'mattn/emmet-vim'
 Plug 'airblade/vim-gitgutter' |
    \ Plug 'tpope/vim-fugitive'
 " to see hex colors"
 Plug 'ap/vim-css-color'
Plug  'alvan/vim-closetag'
"    gS to split a one-liner into multiple lines
"    gJ (with the cursor on the first line of a block) to join a block into a single-line statement.
Plug 'AndrewRadev/splitjoin.vim'
" goooooooooood!!, more text objects!!
Plug 'wellle/targets.vim'
 " misc
 Plug 'mbbill/undotree'
 Plug 'tpope/vim-repeat'
 Plug 'lervag/vimtex'
 Plug 'KeitaNakamura/tex-conceal.vim' "this is for latex equations
 Plug 'liuchengxu/vim-which-key'
 Plug 'junegunn/goyo.vim'
 Plug 'tpope/vim-surround'
 Plug 'easymotion/vim-easymotion'
 Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'  } |
             \ Plug 'Xuyuanp/nerdtree-git-plugin' |
             \ Plug 'ryanoasis/vim-devicons' |
             \ Plug 'vwxyutarooo/nerdtree-devicons-syntax' |
Plug 'jupyter-vim/jupyter-vim'
Plug 'bkad/CamelCaseMotion'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'Akuseru1/vim-indent-object'

" good guide for dev nvim
"https://hanspinckaers.com/posts/2020/01/vim-python-ide/
"https://github.com/wellle/targets.vim

"
" for c++
"Plug 'preservim/tagbar'
"Plug ‘ludovicchabant/vim-gutentags’
"Plug 'https://github.com/sonph/onehalf', {'rtp': 'vim/'}
"Plug 'https://github.com/dracula/vim', {'as': 'dracula'}
"need both
call plug#end()
