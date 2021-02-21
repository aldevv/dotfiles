call plug#begin()

" basic editor stuff (mkdir, move etc)
" Plug 'tpope/vim-eunuch'
" themes
" Plug 'morhetz/gruvbox'
Plug 'gruvbox-community/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'crusoexia/vim-monokai'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
" Plug 'ayu-theme/ayu-vim'
Plug 'kuntau/ayu-vim'
" Plug 'KeitaNakamura/highlighter.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'uiiaoo/java-syntax.vim'
Plug 'sheerun/vim-polyglot'
" Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" programming
Plug 'bkad/CamelCaseMotion'"
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'
Plug 'preservim/tagbar'
Plug 'AndrewRadev/switch.vim'
Plug 'sbdchd/neoformat'
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

" BUG with lazyredraw!
Plug 'rhysd/clever-f.vim'

"essential
Plug 'wellle/targets.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/ReplaceWithRegister'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle'  } |
         \ Plug 'Xuyuanp/nerdtree-git-plugin' |
         \ Plug 'ryanoasis/vim-devicons' |
         \ Plug 'vwxyutarooo/nerdtree-devicons-syntax'
" Plug 'tpope/vim-vinegar'
"" text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-entire'
Plug 'bps/vim-textobj-python'
Plug 'tommcdo/vim-exchange' "
Plug 'glts/vim-textobj-comment'
Plug 'AndrewRadev/splitjoin.vim'

" to do operations on visual mode
Plug 'vim-scripts/vis'
Plug 'matze/vim-move'
Plug 'francoiscabrol/ranger.vim' |
         \ Plug 'rbgrouleff/bclose.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'stsewd/fzf-checkout.vim'
Plug 'kassio/neoterm'
" for commits
Plug 'junegunn/gv.vim'
"enables gbrowse and also hub instead of git (if hub installed)
Plug 'tpope/vim-rhubarb'
" Plug 'dense-analysis/ale'
Plug 'frazrepo/vim-rainbow'
Plug 'tpope/vim-dispatch'
Plug 'vim-test/vim-test'
Plug 'wincent/vcs-jump'
Plug 'szw/vim-maximizer'
Plug 'stefandtw/quickfix-reflector.vim'
" task manager
Plug 'vuciv/vim-bujo'
Plug 'vim-utils/vim-man'
Plug 'osyo-manga/vim-brightest'
Plug 'tpope/vim-projectionist'
Plug 'bfrg/vim-cpp-modern'
Plug 'puremourning/vimspector'
" Plug 'srydell/vim-skeleton'
"  Plug 'akuseru1/vim-skeleton'
" Plug 'SirVer/ultisnips'

"FUN STUFF"
" needs neovim 0.5
Plug 'ThePrimeagen/vim-apm'
Plug 'ThePrimeagen/vim-be-good'
Plug 'KabbAmine/zeavim.vim'
Plug 'tpope/vim-obsession'

"not working because of conflict with polyglot
" Plug 'wellle/context.vim'

" check https://github.com/mattboehm/dotfiles/blob/master/vim/vimrc
"
"TODO
"tabnine
"
call plug#end()

" WORKING ALTERNATIVES
" Plug 'thaerkh/vim-indentguides' for indentLines
" ============================================
" good guide for dev nvim
"https://hanspinckaers.com/posts/2020/01/vim-python-ide/
"https://github.com/wellle/targets.vim

" deleted
" Plug 'liuchengxu/vista.vim' " changed for tagbar
" Plug 'scrooloose/syntastic'
" Plug ‘ludovicchabant/vim-gutentags’
" Plug 'pseewald/vim-anyfold'"
" Plug 'https://github.com/sonph/onehalf', {'rtp': 'vim/'}
" Plug 'psf/black', { 'branch': 'stable' }
" Plug 'prettier/vim-prettier', {
         " \ 'do': 'npm install',
         " \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] ,
         " \ 'branch': 'release/1.x'}
