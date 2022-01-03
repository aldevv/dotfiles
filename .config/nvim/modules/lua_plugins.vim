"===============
" LUA EXTENSIONS
"===============
Plug 'ThePrimeagen/vim-apm'
Plug 'ThePrimeagen/vim-be-good'
"=====
" LSP
"=====
if !empty($NOCOC)
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
endif
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

