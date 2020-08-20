export C_INCLUDE_PATH=.:~/Documents/mlibs
export EPISODES=~/Downloads
export TERMINAL=st
export COLORTERM=truecolor
export TERM=st
export BAT_THEME=OneHalfDark
export SHELL=/bin/zsh
export PATH="$HOME/.symfony/bin:$PATH"
# you can source sxhkd & here if you login from console
# export SI=https://meet.google.com/ixe-gxnu-ovp
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=firefox
export BOOKS="$HOME/Documents/Learn/Books"
export PROJECTS="$HOME/Documents/Learn/Projects"
export SCRIPTS="$HOME/.local/share/myScripts"
export SHARED="$SCRIPTS/shared"
export UTILITIES="$SCRIPTS/utilities"
export AUTOMATION="$SCRIPTS/automation"
export APPS="$SCRIPTS/apps"
export SUCKLESS="$HOME/.local/Programs/Suckless"
export BACKUPS="$HOME/.backups"
export PROGRAMS="$HOME/.local/Programs"
export WIKI="$HOME/.local/share/wiki"
export READER=zathura
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
#for cargo
export PATH="$HOME/.cargo/bin:$PATH"
#add all files in these directories to the PATH
export PATH="$(du $SHARED | cut -f2 | tr '\n' ':')$PATH"
export PATH="$(du $APPS | cut -f2 | tr '\n' ':')$PATH"
export PATH="$(du $UTILITIES  | cut -f2 | tr '\n' ':')$PATH"
export PATH="$(du $AUTOMATION | cut -f2 | tr '\n' ':')$PATH" 
export PATH="$(du $HOME/.local/bin | cut -f2 | tr '\n' ':')$PATH"

# Settings for Japanese input
export GTK_IM_MODULE='ibus'
export QT_IM_MODULE='ibus'
export XMODIFIERS=@im='ibus'

#fzf
# export FZF_DEFAULT_COMMAND="find * -type f -not -path "
# export FZF_DEFAULT_COMMAND="find * -type f build -not \( -path miniconda3/* -prune \) -not \( -path node_modules/* -prune \) "
export FZF_DEFAULT_COMMAND="rg --files --follow -g '!{**/node_modules/*,.git,miniconda3,env,envs,__pycache__, libs,lib,.wine,core,.npm,.icons,.vscode,*/nvim/backups,.emacs.d/**,.cache,**/undodir/*}'"
export FZF_DEFAULT_OPTS='--bind=ctrl-e:up,ctrl-n:down'
#colors less
#export  LESS_TERMCAP_mb=$'\e[1;31m'
#export  LESS_TERMCAP_md=$'\e[1;31m'
#export  LESS_TERMCAP_me=$'\e[0m'
#export  LESS_TERMCAP_se=$'\e[0m' 
#export  LESS_TERMCAP_so=$'\e[1;44;33m' 
#export  LESS_TERMCAP_ue=$'\e[0m' 
#export  LESS_TERMCAP_us=$'\e[1;32m'

export MANPAGER='less -s -M +Gg'
export GROFF_NO_SGR=1                  # for konsole and gnome-terminal
export LESS_TERMCAP_mb=$( printf '\E[01;31m')
export LESS_TERMCAP_md=$( printf '\E[01;31m')
export LESS_TERMCAP_me=$( printf '\E[0m')
export LESS_TERMCAP_se=$( printf '\E[0m')
export LESS_TERMCAP_so=$( printf '\E[01;47;34m')
export LESS_TERMCAP_ue=$( printf '\E[0m')
export LESS_TERMCAP_us=$( printf '\E[01;32m')
