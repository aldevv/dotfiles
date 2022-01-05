local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
    debug = false,
    sources = {
        formatting.black.with({ extra_args = { "--fast" } }),
        formatting.stylua.with({ extra_args = { "--indent-type", "Spaces" } }),
        formatting.shfmt,
        formatting.clang_format,
        diagnostics.eslint,
        -- diagnostics.selene,
        -- formatting.eslint,
        -- diagnostics.eslint,
        -- formatting.prettier,
        -- diagnostics.flake8,
        -- completion.spell,
        -- code_actions.gitsigns,
    },
})
