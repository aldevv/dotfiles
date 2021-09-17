-- checkout:
-- telescope.nvim
-- refactor.lua
-- navigator.lua
vim.cmd('set t_Co=256')
vim.cmd('let IS_MINE=isdirectory($SUCKLESS)')

--==================
-- SETTINGS
--==================
vim.cmd('source ~/.config/nvim/modules/settings.vim')

--==================
-- KEYBINDINGS
--==================

vim.cmd('source ~/.config/nvim/modules/keybindings.vim')

if (vim.fn.getenv('USER') ~= 'root') then
--===================
-- DEPENDENCIES
--===================
vim.cmd('source ~/.config/nvim/modules/dependencies.vim')

--==================
-- PLUGINS SETTINGS
--==================
vim.cmd([[
  source ~/.config/nvim/modules/plugins.vim
" source ~/.config/nvim/modules/plugins2.vim
  source ~/.config/nvim/modules/plugins-settings.vim
]])
end
--==================
-- APPEARANCE
--==================


vim.cmd('source ~/.config/nvim/modules/appearance.vim')

--==================
-- AUTOMATION
--==================
vim.cmd('source ~/.config/nvim/modules/automation.vim')

--====================================================
-- create your own text objects
-- https://github.com/kana/vim-textobj-user
--
--  for popular text objects
-- https://github.com/kana/vim-textobj-user/wiki
--
-- run in the background use jobstart
-- map <leader>ra :call jobstart('setsid st -e ranger $(dirname %) 2>&1')<cr>
-- cgn change <highlighted item>, useful when you searched something
-- commands
--
--  see operator pending mappings (omap) for keybinding mappings
--
-- SEE WHAT KEYS ARE MAPPED!
-- :verbose imap <leader>
-- :verbose nmap <localleader>
-- :verbose xmap <leader>
--
--
-- Use Start! to run programs, and Dispatch to compile them
