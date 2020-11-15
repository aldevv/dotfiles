" read usr_1 for hard/fast way of learning vimscript
" read vimscript the hard way easy/slow way of learning vimscript
"
" ============================
"   My nvim Colemak dotfile
"============================
"     ________ ++     ________
"    /VVVVVVVV\++++  /VVVVVVVV\
"    \VVVVVVVV/++++++\VVVVVVVV/
"     |VVVVVV|++++++++/VVVVV/'
"     |VVVVVV|++++++/VVVVV/'
"    +|VVVVVV|++++/VVVVV/'+
"  +++|VVVVVV|++/VVVVV/'+++++
"+++++|VVVVVV|/VVV___++++++++++
"  +++|VVVVVVVVVV/##/ +_+_+_+_
"    +|VVVVVVVVV___ +/#_#,#_#,\
"     |VVVVVVV//##/+/#/+/#/'/#/
"     |VVVVV/'+/#/+/#/+/#/ /#/
"     |VVV/'++/#/+/#/ /#/ /#/
"     'V/'  /##//##//##//###/
"              ++
"
"\v magic : makes it work like grep -E
"fzf choose folder with :File <myfolder>
"
"create your own text objects
"https://github.com/kana/vim-textobj-user
"
" for popular text objects
"https://github.com/kana/vim-textobj-user/wiki
"
"run in the background use jobstart
"map <leader>ra :call jobstart('setsid st -e ranger $(dirname %) 2>&1')<cr>
set t_Co=256
"cgn change <highlighted item>, useful when you searched something
"install plugs
"sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"
"
"expand('%:p:h')  for directory of file
"shellescape: has 2 uses, in system() and in :!. pass 1 for :! commands so it escapes the quotes, and dont pass anything for system()
"commands
"
" see operator pending mappings (omap) for keybinding mappings
"
"SEE WHAT KEYS ARE MAPPED!
":verbose imap <leader>
":verbose nmap <localleader>
":verbose xmap <leader>
"

"to install python3 in checkhealth
"python3 -m pip install --user --upgrade pynvim
"pip3 install neovim-remote
"
"
"==================
" SETTINGS
"==================
source ~/.config/nvim/modules/settings.vim

"==================
" KEYBINDINGS
"==================
source ~/.config/nvim/modules/keybindings.vim

"==================
" PLUGINS
"==================
 source ~/.config/nvim/modules/plugins.vim

"==================
" PLUGINS SETTINGS
"==================
 source ~/.config/nvim/modules/plugins-settings.vim

"==================
" APPEARANCE
"==================
 source ~/.config/nvim/modules/appearance.vim

"==================
" AUTOMATION
"==================
source ~/.config/nvim/modules/automation.vim

