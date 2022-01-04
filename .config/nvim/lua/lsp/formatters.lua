local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

null_ls.setup({
    debug = false,
    sources = {
        formatting.black.with({ extra_args = { "--fast" } }),
        formatting.stylua,
        formatting.clang_format,
        -- diagnostics.eslint,
        -- formatting.eslint,
        -- diagnostics.eslint,
        -- formatting.prettier,
        -- diagnostics.flake8,
        -- completion.spell,
    },
})
