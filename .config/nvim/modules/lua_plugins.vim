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
  Plug 'onsails/lspkind-nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'jose-elias-alvarez/null-ls.nvim' " requires plenary
  Plug 'SirVer/ultisnips'
  Plug 'quangnguyen30192/cmp-nvim-ultisnips'
" try nvim-tree
" try null-ls for formatting, linters/diagnostics
endif
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

