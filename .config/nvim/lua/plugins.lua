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
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = req("core.treesitter"),
        })
        use({
            "ahmedkhalf/project.nvim",
            config = req("lsp.project"),
        })

        -- Lazy loading:
        -- Load on specific commands
        use({
            "tpope/vim-dispatch",
            opt = true,
            cmd = { "Dispatch", "Make", "Focus", "Start" },
            ft = { "sh", "python", "c", "cpp", "js", "ts" },
        })

        use({
            "kyazdani42/nvim-tree.lua",
            requires = "kyazdani42/nvim-web-devicons", -- optional, for file icon
            wants = "nvim-web-devicons",
            config = req("core.nvim-tree"),
            cmd = { "NvimTreeToggle", "NvimTreeOpen" },
        })

        use({
            "nvim-telescope/telescope.nvim",
            requires = { { "nvim-lua/plenary.nvim" } },
            config = req("core.telescope"),
        })

        use({
            "ThePrimeagen/harpoon",
            opt = true,
            requires = { { "nvim-lua/plenary.nvim" } },
            config = req("core.harpoon"),
        })

        use({
            "phaazon/hop.nvim",
            branch = "v1", -- optional but strongly recommended
            config = function()
                require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
            end,
        })

        use({
            "mfussenegger/nvim-dap",
            requires = {
                {
                    "Pocco81/DAPInstall.nvim",
                    "rcarriga/nvim-dap-ui",
                    "theHamsta/nvim-dap-virtual-text",
                },
            },
            -- keys = { "<leader>cdb", "<leader>cdBc", "<leader>cdBC", "<leader>cdBe", "<leader>cdBl","<leader>cdBh" },
            config = req("lsp.dap"),
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
