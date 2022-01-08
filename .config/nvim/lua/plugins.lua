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
            "neovim/nvim-lspconfig",
            config = req("lsp.lsp"),
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
            "ahmedkhalf/project.nvim",
            config = req("lsp.project"),
            event = "BufWinEnter",
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
            requires = { "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" }, -- optional, for file icons
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
    end,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
        },
    },
})
