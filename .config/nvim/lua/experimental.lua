--===================
-- TREE SITTER
-- ===================

require('nvim-treesitter.configs').setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = {},

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },

    -- list of language that will be disabled
    disable = {},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- =========
-- FOLDING
-- =========
vim.o.foldmethod='expr'
vim.o.foldexpr='nvim_treesitter#foldexpr()'
vim.o.foldlevel=20


-- noremap ze zk
-- noremap zn zj
-- noremap zD zE
-- noremap z[ [z
-- noremap z] ]z

-- Buffer-local mappings also take a buffer number as their first argument (0 sets the mapping for the current buffer).
-- ex: vim.api.nvim_buf_set_keymap(0, '', 'cc', 'line(".") == 1 ? "cc" : "ggcc"', { noremap = true, expr = true })
-- :noremap <buffer> <expr> cc line('.') == 1 ? 'cc' : 'ggcc'

vim.api.nvim_set_keymap('', 'ze', 'zk', { noremap = true })
vim.api.nvim_set_keymap('', 'zn', 'zk', { noremap = true })
vim.api.nvim_set_keymap('', 'zD', 'zE', { noremap = true })
