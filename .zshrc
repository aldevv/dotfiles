# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
# only source if you dont login from a terminal
# source ~/.zprofile
#COLEMAK DOTFILES
#!  https://rgoswami.me/posts/colemak-dots-refactor/
#autoload -U colors && colors	# Load colors
#PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# wal -i [picture]
#export GTK_IM_MODULE=fcitx 

export ZSH="/home/solus/.oh-my-zsh"
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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/solus/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/solus/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/solus/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/solus/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#
#

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
plugins=(git colemak lol z node npm vscode extract systemd)
#should add docker if i use it someday
#https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vscode

source $ZSH/oh-my-zsh.sh

# setup dotrepo
#
#git init --bare $HOME/Documents/DotFilesRepository
#git init --bare $HOME/Documents/ProjectsRepository
#dotrepo config --local status.showUntrackedFiles no
#prorepo config --local status.showUntrackedFiles no

# Aliases 
alias station="~/.local/bin/Station-1.65.0-x86_64.AppImage"\
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
	pkg='sudo eopkg'\
	xi='sudo vim /etc/X11/xinit/xinitrc'\
	xa='sudo /opt/lampp/manager-linux-x64.run'\
	djan='cd /home/solus/dev/trydjango/src'\
	corona='/home/solus/dev/corona/get_info'\
	tord='/home/solus/.local/share/torbrowser/tbb/x86_64/tor-browser_en-US/Browser/Downloads'\
	sac='source env/bin/activate'\
	ven='wine .wine/drive_c/Program\ Files/Vensim/venPLE32.exe'\
    dotrepo="git --git-dir=$HOME/Documents/DotFilesRepository/ --work-tree=$HOME"\
	dst='dotrepo status'\
	daa='dotrepo add'\
	dau='dotrepo add -u'\
	dc='dotrepo commit'\
	dlg='dotrepo log --oneline'\
	dgp='dotrepo push origin HEAD'\
	pgp='uploadProjects'\
	m='$AUTOMATION/ncmpcppStart.sh'\
	restartx='sudo systemctl restart display-manager'\
	flat='flatpak --installation=extra'\
	spot='flatpak --installation=extra run com.spotify.Client'\
	glv='git log --oneline --decorate --all --graph'\
	zealu='zeal-user-contrib'\
    ph='python_help'\
    trc='transmission-remote-cli'\
    py='python3'\

	
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
# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'
#
#
# adding flags
alias cp="cp -i"                          # confirm before overwriting something
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

#
#completion and highlighting
fpath=($PROGRAMS/zsh-completions/src $fpath)
source $PROGRAMS/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.aliases
