call plug#begin()

" Plug 'tpope/vim-eunuch' basic editor stuff (mkdir, move etc)
" =============
" THEMES
" =============
Plug 'gruvbox-community/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'crusoexia/vim-monokai'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
" Plug 'ayu-theme/ayu-vim'
" Plug 'kuntau/ayu-vim'

" Plug 'KeitaNakamura/highlighter.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'tomasiser/vim-code-dark'

" =============
" PROGRAMMING
" =============

if empty($NOCOC)
  " formatting
  Plug 'sheerun/vim-polyglot'
  Plug 'uiiaoo/java-syntax.vim'
  Plug 'bfrg/vim-cpp-modern'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'stsewd/fzf-checkout.vim'
  Plug 'antoinemadec/coc-fzf'
  Plug 'chengzeyi/fzf-preview.vim'
  " lsp
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'sbdchd/neoformat'
  Plug 'ap/vim-css-color'
endif

Plug 'preservim/tagbar'
Plug 'AndrewRadev/switch.vim' " luasnips will cover this functionality
Plug 'yggdroot/indentLine'
" Plug 'jupyter-vim/jupyter-vim'
Plug 'mattn/emmet-vim'
Plug 'mbbill/undotree'
Plug 'liuchengxu/vim-which-key'
Plug 'junegunn/goyo.vim'
Plug 'jremmen/vim-ripgrep'
Plug  'alvan/vim-closetag'
Plug 'LunarWatcher/auto-pairs'

" BUG with macros!
" Plug 'rhysd/clever-f.vim' " check lightspeed

"=============
" ESSENTIAL
"=============
" Plug 'wellle/targets.vim'
" Plug 'tpope/vim-repeat'
" Plug 'tommcdo/vim-exchange' "
" Plug 'tpope/vim-surround'
" Plug 'kana/vim-textobj-user'
" Plug 'kana/vim-textobj-line'
" Plug 'kana/vim-textobj-entire'

Plug 'bkad/CamelCaseMotion'"
" Plug 'tpope/vim-projectionist'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'editorconfig/editorconfig-vim'

"=============
" TEXT OBJECTS
"=============
Plug 'bps/vim-textobj-python'
Plug 'glts/vim-textobj-comment'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'matze/vim-move' "to do operations on visual mode
Plug 'vim-scripts/vis'
Plug 'rbgrouleff/bclose.vim'
Plug 'junegunn/gv.vim' " for commits
Plug 'tpope/vim-rhubarb' "enables gbrowse and also hub instead of git (if hub installed)
Plug 'frazrepo/vim-rainbow'
Plug 'wincent/vcs-jump'
Plug 'szw/vim-maximizer'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'osyo-manga/vim-brightest'
Plug 'KabbAmine/zeavim.vim'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter' |
         \ Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-dispatch' --> used in packer
Plug 'vim-test/vim-test'
Plug 'tpope/vim-obsession'

" Plug 'tpope/vim-dotenv'

Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-cheat.sh'

Plug 'c-brenn/fuzzy-projectionist.vim'

" Plug 'godlygeek/tabular' " for markdown
" Plug 'plasticboy/vim-markdown'


if !empty(glob("$XDG_CONFIG_HOME/nvim/modules/lua_plugins.vim"))
    source $XDG_CONFIG_HOME/nvim/modules/lua_plugins.vim
endif
" ================
" NO LONGER USED
" ================
" Plug 'easymotion/vim-easymotion'  --> changed for hop
" Plug 'lervag/vimtex' " works, but i don't use latex natively
" Plug 'KeitaNakamura/tex-conceal.vim' "this is for latex equations
" Plug 'vim-utils/vim-man'
" Plug 'vuciv/vim-bujo' " task manager
" Plug 'tpope/vim-dadbod'
" Plug 'dbeniamine/cheat.sh-vim'
" Plug 'tpope/vim-vinegar'
" Plug 'kana/vim-textobj-indent'
" Plug 'kassio/neoterm' " change to nvim builtin term



call plug#end()

" TODO remove neoterm
" pending
" hop.nvim
" refactor.nvim
" harpoon.nvim
" TODO check these 3!!
" https://github.com/kristijanhusak/vim-dadbod-ui
" CocSearch substitute https://github.com/dyng/ctrlsf.vim

" for fcitx (when writting in jap)
"https://aur.archlinux.org/packages/vim-fcitx/
"not working because of conflict with polyglot
" Plug 'wellle/context.vim'
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
