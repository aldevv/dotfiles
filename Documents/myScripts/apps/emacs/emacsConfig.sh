cd ~/.emacs.d && awk '{print $2 }' ~/Documents/myScripts/emacs/emacsDependencies | xargs -n 1 git clone
