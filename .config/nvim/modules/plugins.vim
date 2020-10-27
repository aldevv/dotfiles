call plug#begin()

" basic editor stuff (mkdir, move etc)
" Plug 'tpope/vim-eunuch'
" themes
Plug 'morhetz/gruvbox'
" Plug 'fcpg/vim-fahrenheit'
" Plug 'tomasiser/vim-code-dark'
" Plug 'dracula/vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" programming
" Plug 'uiiaoo/java-syntax.vim'
Plug 'bkad/CamelCaseMotion'"{{{
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vista.vim'
Plug 'preservim/tagbar'
Plug 'AndrewRadev/switch.vim'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/syntastic'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'chengzeyi/fzf-preview.vim'
Plug 'yggdroot/indentLine'
Plug 'jupyter-vim/jupyter-vim'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter' |
         \ Plug 'tpope/vim-fugitive'
Plug 'ap/vim-css-color'
Plug  'alvan/vim-closetag'
Plug 'mbbill/undotree'
Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim' "this is for latex equations
Plug 'liuchengxu/vim-which-key'
Plug 'junegunn/goyo.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'rhysd/clever-f.vim'
Plug 'pseewald/vim-anyfold'"}}}

"essential
Plug 'wellle/targets.vim'"{{{
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'  } |
         \ Plug 'Xuyuanp/nerdtree-git-plugin' |
         \ Plug 'ryanoasis/vim-devicons' |
         \ Plug 'vwxyutarooo/nerdtree-devicons-syntax' |

" text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-entire'
Plug 'bps/vim-textobj-python'
Plug 'tommcdo/vim-exchange' "
Plug 'glts/vim-textobj-comment'
Plug 'AndrewRadev/splitjoin.vim'"}}}

" to do operations on visual mode
Plug 'vim-scripts/vis'
Plug 'matze/vim-move'
Plug 'francoiscabrol/ranger.vim' |
         \ Plug 'rbgrouleff/bclose.vim'
Plug 'osyo-manga/vim-brightest'
Plug 'jiangmiao/auto-pairs'

"not working because of conflict with polyglot
" Plug 'wellle/context.vim'

" check https://github.com/mattboehm/dotfiles/blob/master/vim/vimrc
" for letting a single extension take care of formatting
" for commits
"Plug 'junegunn/gv.vim'
" for sending commands to terminal
"Plug 'kassio/neoterm'
" context to where you are in the code

"TODO
"
"look at
"https://github.com/mattboehm/dotfiles/blob/master/vim/vimrc
"for more
"
" still not working correctly for neovim
" Plug 'puremourning/vimspector'

" can change this now that i have textobj-user

" good guide for dev nvim
"https://hanspinckaers.com/posts/2020/01/vim-python-ide/
"https://github.com/wellle/targets.vim

" deleted
" for c++
"Plug 'preservim/tagbar'
"Plug ‘ludovicchabant/vim-gutentags’
"Plug 'https://github.com/sonph/onehalf', {'rtp': 'vim/'}
"Plug 'https://github.com/dracula/vim', {'as': 'dracula'}
" Plug 'psf/black', { 'branch': 'stable' }
" Plug 'prettier/vim-prettier', {
         " \ 'do': 'npm install',
         " \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] ,
         " \ 'branch': 'release/1.x'}
"need both
call plug#end()

