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

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

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
        requires = {
            "kyazdani42/nvim-web-devicons", -- optional, for file icon
        },
        config = function()
            require("nvim-tree").setup({})
        end,
    })

    use({
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    use({
        "ThePrimeagen/harpoon",
        requires = { { "nvim-lua/plenary.nvim" } },
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
        requires = { {
            "Pocco81/DAPInstall.nvim",
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text"
        } },
    })
end)
