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
Plug 'bkad/CamelCaseMotion'
 Plug 'sheerun/vim-polyglot'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'scrooloose/syntastic'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 Plug 'tpope/vim-commentary'
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'junegunn/fzf.vim'
 Plug 'yggdroot/indentLine'
 " explicitly put the release/1.x, because Master was failing"
 Plug 'prettier/vim-prettier', {
   \ 'do': 'npm install',
   \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] ,
   \ 'branch': 'release/1.x'}
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
 " misc
Plug 'mbbill/undotree'
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim' "this is for latex equations
Plug 'liuchengxu/vim-which-key'
Plug 'junegunn/goyo.vim'
"essential
Plug 'wellle/targets.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'  } |
             \ Plug 'Xuyuanp/nerdtree-git-plugin' |
             \ Plug 'ryanoasis/vim-devicons' |
             \ Plug 'vwxyutarooo/nerdtree-devicons-syntax' |
Plug 'jupyter-vim/jupyter-vim'
" text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-entire'
Plug 'bps/vim-textobj-python'
Plug 'tommcdo/vim-exchange' "
Plug 'glts/vim-textobj-comment'
" to do operations on visual mode
Plug 'vim-scripts/vis'
" move blocks in visual
Plug 'matze/vim-move'
Plug 'chengzeyi/fzf-preview.vim'
" still not working correctly for neovim
" Plug 'puremourning/vimspector'

" can change this now that i have textobj-user

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
