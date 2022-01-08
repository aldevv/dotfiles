-- checkout:
-- telescope.nvim
-- refactor.lua
-- navigator.lua
vim.cmd("set t_Co=256")
vim.cmd("let IS_MINE=isdirectory($SUCKLESS)")

--==================
-- SETTINGS
--==================
vim.cmd("source $XDG_CONFIG_HOME/nvim/modules/settings.vim")

--==================
-- KEYBINDINGS
--==================
vim.cmd("source $XDG_CONFIG_HOME/nvim/modules/keybindings.vim")
if os.getenv("USER") == "root" then
    vim.cmd("source $XDG_CONFIG_HOME/nvim/modules/appearance.vim")
    vim.cmd("source $XDG_CONFIG_HOME/nvim/modules/automation.vim")
    return
end
--===================
-- DEPENDENCIES
--===================
vim.cmd("source $XDG_CONFIG_HOME/nvim/modules/dependencies.vim")

--==================
-- PLUGINS
--==================
if os.getenv("DEBUG") then
    vim.cmd([[
    source $XDG_CONFIG_HOME/nvim/modules/plugins2.vim
  ]])
else
    vim.cmd([[
    source $XDG_CONFIG_HOME/nvim/modules/plugins.vim
    source $XDG_CONFIG_HOME/nvim/modules/plugins-settings.vim
  ]])
end

--==================
-- APPEARANCE
--==================
vim.cmd("source $XDG_CONFIG_HOME/nvim/modules/appearance.vim")

--==================
-- AUTOMATION
--==================
vim.cmd("source $XDG_CONFIG_HOME/nvim/modules/automation.vim")
--====================================================
if os.getenv("NOCOC") then
    require("plugins")
    require("lsp")
    require("config")
    require("core")
end

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
--
