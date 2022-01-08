"===============
" LUA EXTENSIONS
"===============
"=====
" LSP
"=====
if !empty($NOCOC)
  Plug 'ThePrimeagen/vim-apm'
  Plug 'ThePrimeagen/vim-be-good'
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  Plug 'jose-elias-alvarez/null-ls.nvim' " requires plenary
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-nvim-lua'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'onsails/lspkind-nvim'
  Plug 'SirVer/ultisnips'
  Plug 'quangnguyen30192/cmp-nvim-ultisnips'
  Plug 'nvim-treesitter/playground'
  Plug 'nvim-lualine/lualine.nvim'
endif

" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'phaazon/hop.nvim'
" nvim-dap
" nvim-telescope-dap
" harpoon
" hop
" fzf-native for telescope (better performance)
