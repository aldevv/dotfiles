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

local function req(module)
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
            config = req("lsp.ultisnippets"),
            requires = "quangnguyen30192/cmp-nvim-ultisnips",
        })
        use("honza/vim-snippets")

        -- use({
        --     "L3MON4D3/LuaSnip"
        -- })
        --
        -- use({ "windwp/nvim-autopairs", config = req("core.autopairs") }) -- no one key
        -- fastwrap
        use({
            "ray-x/lsp_signature.nvim",
            config = req("lsp.lsp-signature"),
        })
        use({
            "hrsh7th/nvim-cmp",
            requires = {
                "onsails/lspkind-nvim",
                "hrsh7th/cmp-nvim-lsp",
                { "hrsh7th/cmp-nvim-lua", ft = "lua" },
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-buffer",
                -- "saadparwaiz1/cmp_luasnip",
                { "quangnguyen30192/cmp-nvim-ultisnips" },
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
            event = "VimEnter",
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
            requires = {
                { "Pocco81/DAPInstall.nvim", module = "dap-install" },
                { "rcarriga/nvim-dap-ui", module = "dapui" },
                { "theHamsta/nvim-dap-virtual-text", module = "nvim-dap-virtual-text" },
            },
            module = "dap",
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
        use({
            "folke/which-key.nvim",
            config = req("config.appearance.whichkey"),
        })
        use({
            "yggdroot/indentLine",
            config = function()
                vim.g.indentLine_char = "┆"
                vim.g.indentLine_enabled = 0
            end,
        })
        use({
            "Pocco81/TrueZen.nvim",
            config = req("core.truezen"),
            cmd = { "TZMinimalist", "TZFocus", "TZAtaraxis", "TZBottom", "TZLeft", "TZTop" },
        })

        use({ "AndrewRadev/switch.vim", config = req("core.switch") }) -- luasnips will cover this functionality
        use({
            "mbbill/undotree",
            cmd = { "UndotreeToggle" },
        })
        use("inkarkat/vim-ReplaceWithRegister")
        use({ "preservim/tagbar", cmd = { "TagbarToggle" } })
        use({
            "mattn/emmet-vim",
            config = function()
                vim.g.user_emmet_install_global = 0
            end,
            ft = { "html", "js", "ts", "css", "vue", "svelte", "jsx", "tsx" },
        })
        use({
            "alvan/vim-closetag",
            config = req("core.closetags"),
            ft = { "html", "js", "ts", "css", "vue", "svelte", "jsx", "tsx" },
        })

        use({
            "LunarWatcher/auto-pairs",
            config = req("core.autopairs"),
        })

        use({
            "tpope/vim-projectionist",
            -- requires = "ahmedkhalf/project.nvim",
            -- after = "project",
            -- this breaks _skel!!
            -- cond = function()
            --     print(vim.fn.getcwd())
            --     return require("lspconfig.util").find_git_ancestor(vim.fn.getcwd()) ~= nil
            -- end,
        })

        -- check if there is a file .env
        use({
            "tpope/vim-dotenv",
            requires = {
                "tpope/vim-projectionist",
            },
            cond = function()
                local cwd = require("lspconfig.util").find_git_ancestor(vim.fn.getcwd())
                if cwd ~= nil then
                    return vim.fn.glob(cwd .. "/" .. ".env*") ~= ""
                end
                return false
            end,
        })
        use("jbyuki/one-small-step-for-vimkind") -- debug lua files
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
