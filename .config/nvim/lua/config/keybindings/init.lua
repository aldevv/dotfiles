-- weird menmonics

-- <leader>o --> open diagnostics
-- <leader>, --> config
-- <leader>. --> commands

local s = { silent = true }
local nor = { noremap = true }
local e = { expr = true }
local s_e = vim.tbl_extend("keep", s, e)

local nor_s = vim.tbl_extend("keep", nor, s)
local nor_e = vim.tbl_extend("keep", nor, e)
local nor_e_s = vim.tbl_extend("keep", nor, e, s)

local map = vim.api.nvim_set_keymap
local h = "$XDG_CONFIG_HOME/nvim"
-- backlog
-- <a-?>
-- <a-i>
-- <a-t>
-- <a-h>
-- ¿
-- <leader>N
-- essential

-- colemak
-- map("", "n", "j", nor)
-- map("", "e", "k", nor)
-- map("", "j", "e", nor)
-- map("", "gj", "ge", nor)
-- map("", "gJ", "gE", nor)
-- map("", "l", "i", nor)
-- map("", "i", "l", nor)
-- map("v", "i", "l", nor)
-- map("", "k", "nzzzv", nor)
-- map("", "K", "Nzzzv", nor)
-- map("", "ge", "gk", nor)
-- map("", "gn", "gj", nor)
-- map("", "gk", "gn", nor)
-- map("", "gE", "gJ", nor) -- lines
map("", "E", "mzJ`z", nor) -- lines

map("n", "<leader>cdb", ":lua require'dap'.toggle_breakpoint()<cr>", nor_s)

map("i", ",", ",<c-g>u", nor)
map("i", ".", ".<c-g>u", nor)
map("i", "!", "!<c-g>u", nor)
map("i", "?", "?<c-g>u", nor)

map("v", "<a-n>", ":m '>+1<cr>gv=gv", nor)
map("v", "<a-e>", ":m '<-2<cr>gv=gv", nor)
map("i", "<a-e>", "<esc>:m .-2<cr>==a", nor)
map("i", "<a-n>", "<esc>:m .+1<cr>==a", nor)
map("n", "<a-e>", ":m .-2<cr>==", nor)
map("n", "<a-n>", ":m .+1<cr>==", nor)

map("i", "<c-y>", "copilot#Accept('<CR>')", vim.tbl_extend("keep", s_e, { script = true }))
map('n', "ß", "<Plug>(Switch)", nor_s)
map("", "<leader>cc", ":lua require('utils.lua.keybindings').toggle_copilot()<cr>", nor)
-- map("", "<leader>cc", ":Copilot enable<cr>", nor_s)

-- snippets
map("n", "<leader>si", "<Plug>(InsertSkeleton)", s)

-- terminal
map("t", "<a-'>", "<c-\\><c-n>", nor_s)

map("n", "<F1>", ":e " .. h .. "/lua/config/keybindings/init.lua<cr>", nor_s)
map("n", "<F2>", ":e " .. h .. "/modules/keybindings.vim<cr>", nor_s)
map("n", "<F3>", ":e " .. h .. "/modules/plugins-settings.vim<cr>", nor_s)
map("n", "<F4>", ":e " .. h .. "/lua/plugins.lua<cr>", nor_s)
map("n", "<F5>", ":e " .. h .. "/modules/plugins.vim<cr>", nor_s)
map("n", "<F6>", ":e " .. h .. "/lua/lsp/lsp.lua<cr>", nor_s)
map("n", "<F7>", ":e " .. h .. "/lua/lsp/formatters.lua<cr>", nor_s)
map("n", "<F8>", ":e " .. h .. "/init.lua<cr>", nor_s)

-- defaults override
map("", "gh", ":h <c-r><c-w><cr>", nor) -- select mode, not used
map("", "<leader>sh", "<c-l>", {})

local uv = require("utils.vanilla.core")
-- qf
uv.quickfix_toggle_definition()
map("n", "<c-q>q", ":call ToggleQuickFix(0)<cr>", nor_s)
map("n", "<c-q>Q", ":call ToggleQuickFix(1)<cr>", nor_s)
map("n", "<c-q>n", ":cnext<cr>zzzv", nor)
map("n", "<c-q>e", ":cprev<cr>zzzv", nor)

-- ql
uv.location_toggle_definition()
map("n", "<c-l>l", ":call ToggleLocation(0)<cr>", nor_s)
map("n", "<c-l>L", ":call ToggleLocation(1)<cr>", nor_s)
map("n", "<c-l>n", ":lnext<cr>zzzv", nor)
map("n", "<c-l>e", ":lprev<cr>zzzv", nor)

-- folding
map("", "ze", "zk", nor)
map("", "zn", "zk", nor)
map("", "zD", "zE", nor)

-- tagbar
map("n", "<leader>ls", ":TagbarToggle<cr>", nor_s)

map("n", ",", ";", nor_s)
map("n", ";", ",", nor_s)

-- hop
map("n", "s", ":HopChar1<cr>", nor_s)

-- leader commands
-- -----------------
-- whichkey workaround (no BS allowed)
map("n", "<BS>", ":WhichKey \\<cr>", nor_s)

-- telescope
require("config.keybindings.telescope").load_mappings()

-- nvim-tree
map("n", "<leader>se", ":NvimTreeToggle<cr>", nor_s)

-- treesitter
map("n", "<leader>st", ":TSPlaygroundToggle<cr>", nor_s)
map("n", "<leader>sc", ":TSHighlightCapturesUnderCursor<cr>", nor_s)

-- rainbow
map("n", "<leader>sr", ":RainbowToggle<cr>", nor_s)

-- prefix c --> core (plugin toggles)

-- packer
map("n", "<leader>cps", ":PackerStatus<cr>", nor)
map("n", "<leader>cpi", ":PackerInstall<cr>", nor)
map("n", "<leader>cpC", ":PackerClean<cr>", nor)
map("n", "<leader>cpu", ":PackerUpdate<cr>", nor)
map("n", "<leader>cpc", ":PackerCompile<cr>", nor)

-- harpoon
require("config.keybindings.harpoon").load_mappings()

-- dap
require("config.keybindings.harpoon").load_mappings()

--fugitive
-- nnoremap <leader>gll :let g:_search_term = expand("%")<CR><bar>:Gclog -- %<CR>:call search(g:_search_term)<CR>
-- nnoremap <leader>gln :cnext<CR>:call search(_search_term)<CR>
-- nnoremap <leader>glp :cprev<CR>:call search(_search_term)<CR>-

-- prefix . --> commands
map("n", "<leader>.vo", ":noautocmd w | luafile %<cr>", nor_s)
map("n", "<leader>.vd", ":lua require('osv').launch({port=3333})<cr>", nor_s)
map("n", "<leader>.vD", ":lua require('osv').run_this()<cr>", nor_s)

-- .p commands for projects
map("n", "<leader>.pfp", ":!create_projection_file", nor)


map("v", "ll", "<Plug>(textobj-line-i)", s)
map("o", "ll", "<Plug>(textobj-line-i)", s)
map("v", "al", "<Plug>(textobj-line-a)", s)
map("o", "al", "<Plug>(textobj-line-a)", s)

map("v", "le", "<Plug>(textobj-entire-i)", s)
map("o", "le", "<Plug>(textobj-entire-i)", s)
map("v", "ae", "<Plug>(textobj-entire-a)", s)
map("o", "ae", "<Plug>(textobj-entire-a)", s)

-- fun
map("n", "<leader>cfb", ":VimBeGood<cr>", nor)
map("n", "<leader>cfa", ":VimApm<cr>", nor)
map("n", "<leader>cfA", ":VimApmShutdown<cr>", nor)


map("i", "€", "<plug>(emmet-expand-abbr)", {})
map('n', "<leader>su", ":UndotreeToggle<cr>", nor_s)
map('n', "<leader>sv", ":IndentLinesToggle<cr>", nor_s)

-- map('n', "gp", "<Plug>(ReplaceWithRegisterOperator)", nor_s)
-- map('n', "gpp", "<Plug>(ReplaceWithRegisterLine)", nor_s)
-- map('x', "gp", "<Plug>(ReplaceWithRegisterVisual)", nor_s)
--  only works like this
vim.cmd([[
nmap gp  <Plug>ReplaceWithRegisterOperator
nmap gpp <Plug>ReplaceWithRegisterLine
xmap gp  <Plug>ReplaceWithRegisterVisual
]])
