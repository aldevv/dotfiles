setopt KSH_GLOB
# only source if you dont login from a terminal
# source ~/.zprofile
#COLEMAK DOTFILES
#!  https://rgoswami.me/posts/colemak-dots-refactor/
#
#autoload -U colors && colors   # Load colors
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
export SXHKD_SHELL="/usr/bin/sh"
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="agnoster"
# ZSH_THEME="amuse"
ZSH_THEME="af-magic"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )


#functions
#to open man in vim
function manv() {
    for arg in "$@"; do
        nvim -c 'execute "normal! :let no_man_maps = 1\<cr>:runtime ftplugin/man.vim\<cr>:Man '"${arg}"'\<cr>:wincmd o\<cr>"'
    done
}

#
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.



# Add wisely, as too many plugins slow down shell startup.
# # in archlinux put the archlinux plugin!

#should add docker if i use it someday
plugins=(extract)
# z is a command that takes you to the most probable folder
source $ZSH/oh-my-zsh.sh
. $XDG_CONFIG_HOME/zshPlugAlias
#https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vscode

#==============
# SETUP DOTREPO
#==============
#git clone --bare https://github.com/akuseru1/dotfiles
# or
#git init --bare $HOME/Documents/DotFilesRepository
#dotrepo config --local status.showUntrackedFiles no
#==============
# MIGRATING
#==============
# do backups
#mkdir -p .backups/bare ;dotrepo checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .backups/bare/{}
# then do (when everything backed up)
#dotrepo checkout


# Aliases
alias pkg='sudo eopkg'\
    pkgsi="sudo eopkg li -l | awk '/Name:/ {sub(/,$/,\"\",\$2); name= \$2} /Installed Size:/{print \$5\$6, name}' | sort -h "\
    pkgl="sudo eopkg li"\
    pkgs="sudo eopkg sr"\
    pkgi="sudo eopkg it"\
    pkgr="sudo eopkg rm"\
    pkgro="sudo eopkg rmo"\
    dockerclean="docker system prune -a"\
    station="~/.local/bin/Station-1.65.0-x86_64.AppImage"\
    xc="xclip -selection clipboard"\
    j="joplin"\
    v="nvim"\
    xmonad="$HOME/.cabal/bin/xmonad"\
    rz="mpv 'http://www.youtube.com/watch?v=w-RUTZBbGwM'"\
    rick="curl -s -L http://bit.ly/10hA8iC | bash"\
    bt="curl rate.sx"\
    cheat="$UTILITIES/sheetmaker.sh"\
    ytu="$UTILITIES/youtube/YT.tcl"\
    yta="$UTILITIES/youtube/downloadAudio.sh"\
    ytv="$UTILITIES/youtube/downloadVideo.sh"\
    dic="$UTILITIES/dictionary.sh"\
    conv="$UTILITIES/MkvToMp4.sh"\
    par="curl parrot.live"\
    wtr="$UTILITIES/weather.sh"\
    ssr="simplescreenrecorder"\
    yt="youtube-viewer"\
    rr="ranger"\
    todoist="cd ~/Programs/todoist-linux && make up"\
    ma="make && sleep 0.5 ./a.out"\
    uncompress='tar xvzf'\
    code='code-oss'\
    pydocs='~/Documents/myScripts/python_documentation.sh'\
    xi='sudo vim /etc/X11/xinit/xinitrc'\
    xa='sudo /opt/lampp/manager-linux-x64.run'\
    djan='cd /home/solus/dev/trydjango/src'\
    corona='/home/solus/dev/corona/get_info'\
    tord='/home/solus/.local/share/torbrowser/tbb/x86_64/tor-browser_en-US/Browser/Downloads'\
    saco='source env/bin/activate'\
    sac='source .env/bin/activate'\
    sacr='source env/bin/activate && pip install -r requirements.txt'\
    ven='wine .wine/drive_c/Program\ Files/Vensim/venPLE32.exe'\
    dotrepo="git --git-dir=$HOME/.local/share/dotfiles --work-tree=$HOME"\
    dst='dotrepo status'\
    daa='dotrepo add'\
    dau='dotrepo add -u'\
    dgc='dotrepo commit'\
    dlg='dotrepo log --oneline --reverse'\
    dgpo='dotrepo push origin HEAD'\
    pgp='uploadProjects'\
    restartx='sudo systemctl restart display-manager'\
    flat='flatpak --installation=extra'\
    spot='flatpak --installation=extra run com.spotify.Client'\
    glv='git log --oneline --decorate --all --graph'\
    zealu='zeal-user-contrib'\
    ph='python_help'\
    trc='transmission-remote-cli'\
    py='python3'\
    audio="pavucontrol"\
    plz="sudo"\
    jp="tagainijisho"\


    #python='python3'\

# Keybindings

# so you can use backspace after esc
# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Vi style:
zle -N edit-command-line
bindkey -v

#to fix the backspace problem
bindkey "^?" backward-delete-char
#to fix the backspace shift problem
bindkey "^[[127;2u" backward-delete-char

#to fix the space shift problem, inserts a space
bindkey -s "^[[32;2u" " "

# to delete word using ctrl and backspace
bindkey "^[[127;5u" backward-delete-word

# Colemak.
bindkey -M vicmd "h" backward-char
bindkey -M vicmd "n" down-line-or-history
bindkey -M vicmd "e" up-line-or-history
bindkey -M vicmd "i" forward-char
bindkey -M vicmd "l" vi-insert
bindkey -M vicmd "L" vi-insert-bol
bindkey -M vicmd "k" vi-repeat-search
bindkey -M vicmd "K" vi-rev-repeat-search
bindkey -M vicmd "0" beginning-of-line
bindkey -M vicmd "$" end-of-line
bindkey -M vicmd "j" vi-forward-word-end
bindkey -M vicmd "J" vi-forward-blank-word-end
bindkey -M vicmd v edit-command-line
# Sane Undo, Redo, Backspace, Delete.
bindkey -M vicmd "u" undo
bindkey -M vicmd "U" redo
bindkey -M vicmd "^?" backward-delete-char
bindkey -M vicmd "^[[3~" delete-char

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'e' vi-up-line-or-history
bindkey -M menuselect 'i' vi-forward-char
bindkey -M menuselect 'n' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# export MANPATH="/usr/local/man:$MANPATH"

#
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
# MORE ALIAS
#
# Changing "ls" to "exa", do colour=automatic when piping
alias ls='exa -a --color=automatic --group-directories-first' # my preferred listing
alias l='exa -al --color=automatic --group-directories-first' # my preferred listing
alias la='exa -a --color=automatic --group-directories-first'  # all files and dirs
alias ll='exa -l --color=automatic --group-directories-first'  # long format
alias lt='exa -aT --color=automatic --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'
alias lg='exa -a | grep '
#
#
# adding flags
# alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'

# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../..'
alias .5='cd ../../../..'
alias .6='cd ../../../../..'
#

# youtube-dl
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "
alias ytv-best="youtube-dl -f bestvideo+bestaudio "

alias du="du -hd 1"
alias pk="$PROGRAMS/PacketTracer-AppImage/out/Cisco_Packet_Tracer-7.2.1.glibc2.15-x86_64.AppImage"

alias ampl="/home/solus/Downloads/amplide.linux64/amplide/amplide"
alias tv="/home/solus/.local/Programs/teamviewer/teamviewer"
alias zoom="/home/solus/.local/Programs/zoom/ZoomLauncher"
alias nmone="nmcli d wifi connect HYPERION "
alias nmtwo="nmcli d wifi connect Hyperion_R "
alias nmmobile='nmcli d wifi connect "One plus" '
alias nmc="nmcli d wifi connect"
alias nvmls="nvm ls-remote"
alias nvmch=". $SCRIPTS/useful/node/nvmch"
alias mydot="git clone --depth=1 https://www.github.com/akuseru1/dotfiles"
alias r="sudo rm -rf dwm"
alias i="sudo -E ./prog"
alias ri="r && i"
alias su="sudo su -" # the - lets you have env variables in root
alias sudo="sudo -E" # this enables env variables in sudo
alias flas="export FLASK_APP=app.py && flask run" # this enables env variables in sudo
alias colab="echo \"!wget https://github.com/SpencerPark/IJava/releases/download/v1.3.0/ijava-1.3.0.zip
!unzip ijava-1.3.0.zip
!python install.py --sys-prefix\" | xclip -sel clipboard" # this enables env variables in sudo

#================================= downwards
# slows down from here

# less keybindings
lesskey $XDG_CONFIG_HOME/colemak-less

source ~/.aliases

# makes it slow

#pdfgrep
#completion and highlighting
# source ~/.config/completion_fzf.zsh
# fpath=($PROGRAMS/zsh-completions/src $fpath)
# source $PROGRAMS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# export NVM_DIR="$HOME/.config/nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
