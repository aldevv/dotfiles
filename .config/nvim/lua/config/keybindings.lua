-- lua modules --> https://blog.devgenius.io/create-custom-keymaps-in-neovim-with-lua-d1167de0f2c2
-- examples mappings --> https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/
-- all lsp, formatting, diagnostics and actions are in <Leader>l

-- Buffer-local mappings also take a buffer number as their first argument (0 sets the mapping for the current buffer).
-- ex: vim.api.nvim_buf_set_keymap(0, '', 'cc', 'line(".") == 1 ? "cc" : "ggcc"', { noremap = true, expr = true })
-- :noremap <buffer> <expr> cc line('.') == 1 ? 'cc' : 'ggcc'

-- weird menmonics
-- <leader>o --> open diagnostics
-- <leader>, --> config
-- <leader>. --> commands

local uv = require('utils.vanilla.core')
local s = { silent = true }
local nor = { noremap = true }
local nor_s = vim.tbl_extend('keep', nor, s)
local map = vim.api.nvim_set_keymap


-- backlog
-- <a-i>
-- ¿
-- <a-->
-- <leader>N
local h = "$XDG_CONFIG_HOME/nvim"
-- essential

map("n", "<F1>", ":e "..h.."/lua/config/keybindings.lua<cr>", nor_s)
map("n", "<F2>", ":e "..h.."/modules/keybindings.vim<cr>", nor_s)
map("n", "<F3>", ":e "..h.."/modules/plugins-settings.vim<cr>", nor_s)
map("n", "<F4>", ":e "..h.."/lua/plugins.lua<cr>", nor_s)
map("n", "<F5>", ":e "..h.."/modules/plugins.vim<cr>", nor_s)
map("n", "<F6>", ":e "..h.."/lua/lsp/lsp.lua<cr>", nor_s)
map("n", "<F7>", ":e "..h.."/lua/lsp/formatters.lua<cr>", nor_s)
map("n", "<F8>", ":e "..h.."/init.lua<cr>", nor_s)
-- map('n', '<leader>h', ':ctoggle<cr>', nor_s)

-- folding
map("", "ze", "zk", nor)
map("", "zn", "zk", nor)
map("", "zD", "zE", nor)

-- tagbar
map("n", "<M-n>", ":TagbarToggle<cr>", nor_s)

map("n", ",", ";", nor_s)
map("n", ";", ",", nor_s)

-- hop
map("n", "s", ":HopChar1<cr>", nor_s)

-- leader commands
-- -----------------

-- lsp
-- https://rishabhrd.github.io/jekyll/update/2020/09/19/nvim_lsp_config.html

-- prefix , --> config

-- prefix . --> commands

-- prefix l --> lsp
map("n", "<leader>lf", ":lua vim.lsp.buf.formatting()<cr>", nor_s)
map("v", "<leader>lf", ":lua vim.lsp.buf.range_formatting()<cr>", nor_s)

map("n", "gd", ":lua vim.lsp.buf.definition()<cr>", nor_s)
map("n", "gi", ":lua vim.lsp.buf.implementation()<cr>", nor_s)
map("n", "gr", ":lua vim.lsp.buf.references()<cr>", nor_s)
map("n", "+", ":lua vim.lsp.buf.hover()<cr>", nor_s)

map("n", "<a-->", ":lua vim.lsp.buf.signature_help()<cr>", nor_s)
map("i", "<a-->", "<C-\\><C-O>:lua vim.lsp.buf.signature_help()", nor_s)

map("n", "<c-space>", ":lua vim.lsp.buf.completion()<cr>", nor_s)

map("n", "<leader>ls", ":lua vim.lsp.buf.document_symbol()<cr>", nor_s)
map("n", "<leader>ld", ":lua vim.lsp.buf.declaration()<cr>", nor_s)
map("n", "<leader>lt", ":lua vim.lsp.buf.type_definition()<cr>", nor_s)
map("n", "<leader>la", ":lua vim.lsp.buf.code_action()<cr>", nor_s)
map("v", "<leader>la", ":lua vim.lsp.buf.range_code_action()<cr>", nor_s)

map("n", "<leader>lh", ":lua vim.lsp.buf.document_highlight()<cr>", nor_s) -- for highlighting text
map("n", "<leader>ll", ":lua vim.lsp.buf.clear_references()<cr>", nor_s)
-- autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
-- autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
-- autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()

map("n", "<leader>li", ":lua vim.lsp.buf.incoming_calls()<cr>", nor_s)
map("n", "<leader>lo", ":lua vim.lsp.buf.outgoing_calls()<cr>", nor_s)
map("n", "<leader>lr", ":lua vim.lsp.buf.rename()<cr>", nor_s)

vim.cmd([[ cnoreabbrev LspCmd :lua vim.lsp.buf.execute_command() ]])

-- codelens
map("n", "<leader>lcd", ":lua vim.lsp.codelens.display()<cr>", nor_s)
map("n", "<leader>lcR", ":lua vim.lsp.codelens.refresh()<cr>", nor_s)
map("n", "<leader>lcr", ":lua vim.lsp.codelens.run()<cr>", nor_s)

uv.quickfix_toggle_definition()
uv.location_toggle_definition()
map("n", "<leader>sq", ":call ToggleQuickFix(0)<cr>", nor_s)
map("n", "<leader>sQ", ":call ToggleQuickFix(1)<cr>", nor_s)
map("n", "<leader>sL", ":call ToggleLocation(1)<cr>", nor_s)
map("n", "<leader>sl", ":call ToggleLocation(0)<cr>", nor_s)


-- prefix w --> workspace
map("n", "<leader>ws", ":lua vim.lsp.buf.workspace_symbol()<cr>", nor_s)
map("n", "<leader>wf", ":lua vim.lsp.buf.add_workspace_folder()<cr>", nor_s)
map("n", "<leader>wl", ":lua vim.lsp.buf.list_workspace_folders()<cr>", nor_s)
map("n", "<leader>wr", ":lua vim.lsp.buf.remove_workspace_folder()<cr>", nor_s)

-- prefix o --> diagnostics
map("n", "<leader>oo", ":lua vim.diagnostic.open_float()<cr>", nor_s)
map("n", "<leader>ok", ":lua vim.diagnostic.goto_next()<cr>", nor_s)
map("n", "<leader>oK", ":lua vim.diagnostic.goto_prev()<cr>", nor_s)
map("n", "<leader>on", ":lua vim.lsp.diagnostic.get_namespace()<cr>", nor_s)
map("n", "<leader>ol", ":lua vim.diagnostic.setloclist()<cr>", nor_s)
map("n", "<leader>oq", ":lua vim.diagnostic.setqflist()<cr>", nor_s)


-- telescope
map("n", "<a-p>", ':lua require("telescope.builtin").find_files()<cr>', nor_s)
map("n", "<a-g>", ':lua require("telescope.builtin").git_files()<cr>', nor_s)
map("n", "<a-b>", ':lua require("telescope.builtin").buffers()<cr>', nor_s)
map("n", "<a-r>", ':lua require("telescope.builtin").live_grep()<cr>', nor_s)
map("n", "<a-s-r>", ':lua require("telescope.builtin").grep_string()<cr>', nor_s)


-- deprecated 05/01/2022
-- map('n', '<a-f>', ':lua require("telescope.builtin").file_browser()<cr>',nor_s) https://github.com/nvim-telescope/telescope-file-browser.nvim/issues/3

map("n", "<leader>tt", ":Telescope<cr>", nor_s)
map("n", "<a-h>", ':lua require("telescope.builtin").help_tags()<cr>', nor_s)
-- t core
map("n", "<leader>tch", ':Telescope harpoon marks<cr>', nor_s)

-- t config
map("n", "<leader>tC", ':lua require("telescope.builtin").colorscheme()<cr>', nor_s)

-- telescope lsp
map("n", "<leader>tlr", ':lua require("telescope.builtin").lsp_references()<cr>', nor_s)
map("n", "<leader>tlS", ':lua require("telescope.builtin").lsp_document_symbols()<cr>', nor_s)
map("n", "<a-e>", ':lua require("telescope.builtin").lsp_document_symbols()<cr>', nor_s)
map("n", "<leader>tls", ':lua require("telescope.builtin").lsp_dynamic_workspace_symbols()<cr>', nor_s)
map("n", "<leader>tla", ':lua require("telescope.builtin").lsp_code_actions()<cr>', nor_s)
map("v", "<leader>tla", ':lua require("telescope.builtin").lsp_range_code_actions()<cr>', nor_s)
map("n", "<leader>tlt", ':lua require("telescope.builtin").lsp_type_definitions()<cr>', nor_s)
map("n", "<leader>tli", ':lua require("telescope.builtin").lsp_implementations()<cr>', nor_s)
map("n", "<leader>tld", ':lua require("telescope.builtin").lsp_definitions()<cr>', nor_s)
map("n", "<leader>tlD", ':lua require("telescope.builtin").diagnostics()<cr>', nor_s)
map("n", "<leader>tws", ':lua require("telescope.builtin").lsp_workspace_symbols()<cr>', nor_s)

-- telescope git
map("n", "<leader>tgc", ':lua require("telescope.builtin").git_commits()<cr>', nor_s)
-- 	Lists git commits with diff preview, checkout action <cr>, reset mixed <C-r>m, reset soft <C-r>s and reset hard <C-r>h
map("n", "<leader>tgC", ':lua require("telescope.builtin").git_bcommits()<cr>', nor_s)
-- 	Lists buffer's git commits with diff preview and checks them out on <cr>

map("n", "<leader>tgb", ':lua require("telescope.builtin").git_branches()<cr>', nor_s)
map("n", "<leader>tgs", ':lua require("telescope.builtin").git_status()<cr>', nor_s)
map("n", "<leader>tgS", ':lua require("telescope.builtin").git_stash()<cr>', nor_s)

map("n", "<leader>tp", ':lua require("telescope.builtin").planets()<cr>', nor_s) -- use the telescope!

-- nvim-tree
map("n", "<leader>se", ":NvimTreeToggle<cr>", nor_s)

-- treesitter
map("n", "<leader>st", ":TSPlaygroundToggle<cr>", nor_s)
map("n", "<leader>sc", ":TSHighlightCapturesUnderCursor<cr>", nor_s)

-- rainbow
map("n", "<leader>sr", ":RainbowToggle<cr>", nor_s)

-- prefix c --> core (plugin toggles)
--
-- harpoon
map("n", "<leader>cha", ":lua require('harpoon.mark').add_file()<cr>", nor)
map("n", "<leader>chv", ":lua require('harpoon.ui').toggle_quick_menu()<cr>", nor_s)
map("n", "<leader>chtv", ":lua require('harpoon.cmd-ui').toggle_quick_menu()<cr>", nor_s)
map("n", "<leader>chtl", ":lua require('harpoon.term').sendCommand(1, 'ls -La')<cr>", nor_s) -- first argument is the term #

map("n", "<leader>chk", ":lua require('harpoon.cmd-ui').nav_next()<cr>", nor_s)
map("n", "<leader>chK", ":lua require('harpoon.cmd-ui').nav_prev()<cr>", nor_s)

map("n", "<leader>!", ":lua require('harpoon.term').gotoTerminal(1)<cr>", nor_s)
map("n", '<leader>"', ":lua require('harpoon.term').gotoTerminal(2)<cr>", nor_s)
map("n", "<leader>#", ":lua require('harpoon.term').gotoTerminal(3)<cr>", nor_s)
map("n", "<leader>$", ":lua require('harpoon.term').gotoTerminal(4)<cr>", nor_s)
map("n", "<leader>%", ":lua require('harpoon.term').gotoTerminal(5)<cr>", nor_s)
map("n", "<leader>&", ":lua require('harpoon.term').gotoTerminal(6)<cr>", nor_s)
map("n", "<leader>/", ":lua require('harpoon.term').gotoTerminal(7)<cr>", nor_s)
map("n", "<leader>(", ":lua require('harpoon.term').gotoTerminal(8)<cr>", nor_s)
map("n", "<leader>)", ":lua require('harpoon.term').gotoTerminal(9)<cr>", nor_s)

map("n", "<leader>1", ":lua require('harpoon.ui').nav_file(1)<cr>", nor_s)
map("n", "<leader>2", ":lua require('harpoon.ui').nav_file(2)<cr>", nor_s)
map("n", "<leader>3", ":lua require('harpoon.ui').nav_file(3)<cr>", nor_s)
map("n", "<leader>4", ":lua require('harpoon.ui').nav_file(4)<cr>", nor_s)
map("n", "<leader>5", ":lua require('harpoon.ui').nav_file(5)<cr>", nor_s)
map("n", "<leader>6", ":lua require('harpoon.ui').nav_file(6)<cr>", nor_s)
map("n", "<leader>7", ":lua require('harpoon.ui').nav_file(7)<cr>", nor_s)
map("n", "<leader>8", ":lua require('harpoon.ui').nav_file(8)<cr>", nor_s)
map("n", "<leader>9", ":lua require('harpoon.ui').nav_file(9)<cr>", nor_s)


-- nvim-dap
map("n", "<leader>cdb", ":lua require'dap'.toggle_breakpoint()<cr>", nor_s)
map("n", "<leader>cdc", ":lua require'dap'.continue()<cr>", nor_s)
map("n", "<leader>cdn", ":lua require'dap'.step_over()<cr>", nor_s)
map("n", "<leader>cds", ":lua require'dap'.step_into()<cr>", nor_s)
map("n", "<leader>cdr", ":lua require('dapui').toggle()<cr>", nor_s)
map("n", "<leader>cdR", ":lua require'dap'.repl.open()<cr>", nor_s)
map("n", "<leader>cde", ":lua require('utils.lua.dap').eval()<cr>", nor_s)
map("v", "<leader>cde", ":lua require('dapui').eval()<cr>", nor_s)

-- prefix . --> commands

