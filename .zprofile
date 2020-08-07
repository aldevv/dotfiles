export C_INCLUDE_PATH=.:~/Documents/mlibs
export EPISODES=~/Downloads
export TERMINAL=st
export PATH="$HOME/.symfony/bin:$PATH"
export SI=https://meet.google.com/ixe-gxnu-ovp
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
# you can source sxhkd & here if you login from console
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=firefox
export SCRIPTS="$HOME/Documents/myScripts"
export UTILITIES="$HOME/Documents/myScripts/utilities"
export AUTOMATION="$HOME/Documents/myScripts/automation"
export WIKI="$HOME/Documents/wiki"
export READER=zathura
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
#for cargo
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$(du $SCRIPTS/ranger | cut -f2 | tr '\n' ':')$PATH"
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
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow -g '!{node_modules,.git,miniconda3,env,envs,__pycache__, libs,lib,.wine,core,.npm,.icons,.vscode,*/nvim/backups,.emacs.d/**,.cache}'"

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
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
