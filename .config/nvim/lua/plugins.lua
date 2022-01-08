-- docs -> https://github.com/wbthomason/packer.nvim
--
-- install packer -> git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

-- options
-- run = runs shell command on install/update
-- cmd = nvim commands made from plugin
-- branch = use specific branch
-- config = plugin's configuration

-- Local plugins can be included
-- use '~/projects/personal/hover.nvim'
function req(module)
    return string.format('require("%s")', module)
end

return require("packer").startup({
    function(use)
        use("wbthomason/packer.nvim")

        use({
            "folke/tokyonight.nvim",
            branch = "main",
            config = req("config.appearance.themes.tokyonight"),
        })
        use({
            "nvim-lualine/lualine.nvim",
            requires = { "kyazdani42/nvim-web-devicons", opt = true },
        })

        use({
            "neovim/nvim-lspconfig",
            requires = {
                "williamboman/nvim-lsp-installer",
            },
            config = req("lsp.lsp"),
        })

        use({
            "SirVer/ultisnips",
            config = req("core.snippets"),
        })
        use({
            "hrsh7th/nvim-cmp",
            requires = {
                "onsails/lspkind-nvim",
                "hrsh7th/cmp-nvim-lsp",
                { "hrsh7th/cmp-nvim-lua", ft = "lua" },
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-buffer",
                { "quangnguyen30192/cmp-nvim-ultisnips", requires = "SirVer/ultisnips" },
            },
            config = req("lsp.cmp"),
        })

        use({
            "jose-elias-alvarez/null-ls.nvim",
            requires = { "nvim-lua/plenary.nvim", module_pattern = "plenary" },
            config = req("lsp.formatters"),
        })

        use({
            "nvim-telescope/telescope.nvim",
            requires = {
                "nvim-lua/plenary.nvim",
                { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
            },
            config = req("core.telescope"),
        })

        use({
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = req("core.treesitter"),
        })

        use({
            "nvim-treesitter/playground",
            requires = "nvim-treesitter/nvim-treesitter",
            cmd = { "TSSPlaygroundToggle" },
        })

        use({
            "ahmedkhalf/project.nvim",
            config = req("lsp.project"),
        })

        -- Lazy loading:
        -- Load on specific commands
        use({
            "tpope/vim-dispatch",
            cmd = { "Dispatch", "Make", "Focus", "Start" },
            ft = { "sh", "python", "c", "cpp", "js", "ts", "rs", "go" }, -- test for no filetype
        })

        use({
            "kyazdani42/nvim-tree.lua",
            requires = { "kyazdani42/nvim-web-devicons", opt = true }, -- optional, for file icons
            config = req("core.nvim-tree"),
            cmd = { "NvimTreeToggle", "NvimTreeOpen" },
        })

        use({
            "ThePrimeagen/harpoon",
            requires = { "nvim-lua/plenary.nvim", module_pattern = "plenary" },
            config = req("core.harpoon"),
            module = "harpoon",
        })

        use({
            "phaazon/hop.nvim",
            branch = "v1", -- optional but strongly recommended
            config = function()
                require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
            end,
            cmd = { "HopChar1" },
        })

        use({
            "mfussenegger/nvim-dap",
            opt = true,
            requires = {
                { "Pocco81/DAPInstall.nvim" },
                { "rcarriga/nvim-dap-ui" },
                { "theHamsta/nvim-dap-virtual-text" },
            },
            module_pattern = "dap",
            config = req("lsp.dap"),
        })

        -- add gitsigns

        use({
            "github/copilot.vim",
            cmd = { "Copilot" },
        })

        use({
            "wellle/targets.vim",
            config = function()
                vim.g.targets_aiAI = { "a", "l", "A", "L" }
                vim.g.targets_mapped_aiAI = { "a", "i", "A", "I" }
                vim.g.targets_nl = { "n", "N" }
                -- this script lets you apply macros to multiple lines
                vim.cmd("source ~/.config/nvim/modules/visual-at.vim")
            end,
        })
        use("tpope/vim-repeat")
        use("tommcdo/vim-exchange")
        use("tpope/vim-surround")
        use("kana/vim-textobj-user")
        use({
            "kana/vim-textobj-line",
            config = function()
                vim.g.textobj_line_no_default_key_mappings = 1
            end,
        })
        use({
            "kana/vim-textobj-entire",
            config = function()
                vim.g.textobj_entire_no_default_key_mappings = 1
            end,
        })

        use({
            "plasticboy/vim-markdown",
            requires = "godlygeek/tabular",
            ft = "md",
        })

        -- check if there is a file .projections.json
        use({
            "tpope/vim-projectionist",
            after = "ahmedkhalf/project.nvim",
            cond = function()
                return require("utils.lua.files").file_exists({ file = ".env" })
            end
        })

        -- check if there is a file .env
        use({
            "tpope/vim-dotenv",
            requires = { "tpope/vim-projectionist" },
        })

        -- fun
        use("ThePrimeagen/vim-apm")
        use("ThePrimeagen/vim-be-good")
    end,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
        },
    },
})
