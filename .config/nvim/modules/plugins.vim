call plug#begin()

" Plug 'tpope/vim-eunuch' basic editor stuff (mkdir, move etc)
" =============
" THEMES
" =============
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
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'sbdchd/neoformat'
  Plug 'ap/vim-css-color'
  Plug 'tpope/vim-commentary'
endif

  " Plug 'airblade/vim-gitgutter' |
" Plug 'AndrewRadev/switch.vim' " luasnips will cover this functionality
" Plug 'junegunn/goyo.vim'
" Plug 'yggdroot/indentLine'
" Plug 'mbbill/undotree'
" Plug 'mattn/emmet-vim'
" Plug 'preservim/tagbar'
" Plug  'alvan/vim-closetag'
" Plug 'LunarWatcher/auto-pairs'

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

" Plug 'tpope/vim-projectionist'
"
" Plug 'vim-scripts/ReplaceWithRegister'

" Plug 'bkad/CamelCaseMotion'"
" Plug 'editorconfig/editorconfig-vim'

"=============
" TEXT OBJECTS
"=============
" Plug 'bps/vim-textobj-python'
" Plug 'glts/vim-textobj-comment'

" Plug 'AndrewRadev/splitjoin.vim'
" Plug 'matze/vim-move' "to do operations on visual mode
" Plug 'szw/vim-maximizer'
" Plug 'tpope/vim-dispatch' --> used in packer

" Plug 'vim-scripts/vis'
" Plug 'osyo-manga/vim-brightest'

" Plug 'junegunn/gv.vim' " for commits
" Plug 'rbgrouleff/bclose.vim'
" Plug 'frazrepo/vim-rainbow'

" Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-obsession'
" Plug 'vim-test/vim-test'
" Plug 'tpope/vim-dotenv'
" Plug 'godlygeek/tabular' " for markdown
" Plug 'plasticboy/vim-markdown'

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
