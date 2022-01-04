-- lua modules --> https://blog.devgenius.io/create-custom-keymaps-in-neovim-with-lua-d1167de0f2c2
-- examples mappings --> https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
-- all lsp, formatting, diagnostics and actions are in <Leader>l


-- Buffer-local mappings also take a buffer number as their first argument (0 sets the mapping for the current buffer).
-- ex: vim.api.nvim_buf_set_keymap(0, '', 'cc', 'line(".") == 1 ? "cc" : "ggcc"', { noremap = true, expr = true })
-- :noremap <buffer> <expr> cc line('.') == 1 ? 'cc' : 'ggcc'

-- :h nvim_set_keymap
local map = vim.api.nvim_set_keymap
-- formatting
map('n', '<Leader>lf', ':lua vim.lsp.buf.formatting()<cr>', { noremap = true, silent = true })
map('v', '<Leader>lf', ':lua vim.lsp.buf.range_formatting()<cr>', { noremap = true, silent = true })

-- folding
map('', 'ze', 'zk', { noremap = true })
map('', 'zn', 'zk', { noremap = true })
map('', 'zD', 'zE', { noremap = true })
