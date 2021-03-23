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
"create your own text objects
"https://github.com/kana/vim-textobj-user
"
" for popular text objects
"https://github.com/kana/vim-textobj-user/wiki
"
"run in the background use jobstart
"map <leader>ra :call jobstart('setsid st -e ranger $(dirname %) 2>&1')<cr>
"cgn change <highlighted item>, useful when you searched something
"commands
"
" see operator pending mappings (omap) for keybinding mappings
"
"SEE WHAT KEYS ARE MAPPED!
":verbose imap <leader>
":verbose nmap <localleader>
":verbose xmap <leader>


"Use Start! to run programs, and Dispatch to compile them
 set t_Co=256
 lua require('config')
"==================
" SETTINGS
"==================
 source ~/.config/nvim/modules/settings.vim

"==================
" PLUGINS
"==================
if $USER != "root"
 source ~/.config/nvim/modules/plugins.vim
endif

"==================
" KEYBINDINGS
"==================
 source ~/.config/nvim/modules/keybindings.vim

"==================
" PLUGINS SETTINGS
"==================
if $USER != "root"
 source ~/.config/nvim/modules/plugins-settings.vim
 endif

"==================
" APPEARANCE
"==================
 source ~/.config/nvim/modules/appearance.vim

"==================
" AUTOMATION
"==================
source ~/.config/nvim/modules/automation.vim

