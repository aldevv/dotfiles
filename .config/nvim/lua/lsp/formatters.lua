local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion
local code_actions = null_ls.builtins.code_actions

-- it can be disabled like this
-- if vim.g.started_by_firenvim then
--     vim.g.null_ls_disable = true
-- end

-- config docs
--https://github.com/jose-elias-alvarez/null-ls.nvim/blob/1e131a0b3f52eb812c7c07f5e24aee90c0ee8967/doc/CONFIG.md
--sources
--https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/SOURCES.md
--here are the individual files
-- ~/.local/share/nvim/site/pack/packer/start/null-ls.nvim/lua/null-ls/builtins/formatting
null_ls.setup({
    -- Displays all possible log messages and writes them to the null-ls log, which you can view with the command :NullLsLog. This option can slow down Neovim, so it's strongly recommended to disable it for normal use.
    debug = false,

    log = {
        enable = true,
        level = "warn",
        use_console = "async",
    },
    on_attach = nil,
    sources = {
        formatting.black.with({ extra_args = { "--fast" } }),
        formatting.stylua.with({ extra_args = { "--indent-type", "Spaces" } }),
        formatting.shfmt,
        formatting.clang_format,
        formatting.gofmt,
        formatting.json_tool,
        diagnostics.eslint,
        -- diagnostics.selene,
        -- formatting.eslint,
        -- diagnostics.eslint,
        -- formatting.prettier,
        diagnostics.flake8,
        -- completion.spell,
        -- code_actions.gitsigns,
    },
})
