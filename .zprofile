export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export EDITOR=nvim
export VISUAL=nvim
export LESS='-sSMRQJ -j.5'
export PAGER='less'
# export MANPAGER='less'
export C_INCLUDE_PATH=.:~/Documents/mlibs
export EPISODES=~/Downloads
export TERMINAL=st
export TERM=st
export COLORTERM=truecolor
export BAT_THEME='OneHalfDark'
export BAT_PAGER='less -RF'
export RIPGREP_CONFIG_PATH="$XDG_CONFIG_HOME/rg/.ripgreprc"
export SHELL=/bin/zsh
# you can source sxhkd & here if you login from console
export SXHKD_SHELL="/bin/zsh"
# export SI=https://meet.google.com/ixe-gxnu-ovp
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
export BROWSER=firefox
export BOOKS="$HOME/Documents/Books"
export PROJECTS="$HOME/Master/Projects"
export WORK="$HOME/Master/Work"
export CLASS="$HOME/Master/Classes/2021-1"
export LEARN="$HOME/Master/Learn"
export VOLUMES="$HOME/Master/Volumes"
export SUCKLESS="$HOME/.local/Programs/Suckless"
export BACKUPS="$HOME/.backups"
export PROGRAMS="$HOME/.local/Programs"
export WIKI="$HOME/.local/share/wiki"
export READER=zathura
export NVIM_LOG_FILE="$HOME/.config/nvim/log/log"

export PYTHONPATH="$PYTHONPATH:$PROGRAMS/cpython/Tools/gdb:$PROGRAMS/cpython"

export SCRIPTS="$HOME/.local/share/myScripts"
export SHARED="$SCRIPTS/shared"
export UTILITIES="$SCRIPTS/utilities"
export AUTOMATION="$SCRIPTS/automation"
export APPS="$SCRIPTS/apps"
export OS="$SCRIPTS/os/solus"
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

#qt5ct colorscheme
#breaks copyq
# export QT_QPA_PLATFORMTHEME="qt5ct"
# export QT_PLUGIN_PATH=/usr/lib/qt5/plugins
export PREFIX_DIR="$HOME/.local/Programs/prefix-installs"
if [[ -d $PREFIX_DIR ]]; then
    for dir in "$PREFIX_DIR"/*; do
        dir=${dir:A}
        if [[ -d "$dir/bin" ]]; then
            PATH="$dir/bin:$PATH"
        fi
        if [[ -d "$dir/share/man" ]]; then
            MANPATH="$dir/share/man:$MANPATH"
        fi
        if [[ -d "$dir/lib" ]]; then
            LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$dir/lib"
        fi
        if [[ -d "$dir/lib/pkgconfig" ]]; then
            PKG_CONFIG_PATH="$dir/lib/pkgconfig:$PKG_CONFIG_PATH"
        fi
    done
fi

if [[ -d $PROGRAMS ]]; then
    for dir in "$PROGRAMS"/*; do
        if [[ -d "$dir/man" ]]; then
            MANPATH="$dir/man:$MANPATH"
        fi
    done
fi
export PATH MANPATH LD_LIBRARY_PATH PKG_CONFIG_PATH

#and this is how I uninstall programs in the prefix-install directory :
#rm -rf ~/.user-prefixes/nvim

#======================================
# WORK
#======================================
nvm_path="$HOME/.config/nvm/versions/node"
node=$(ls $nvm_path | sed -n -E '/v[0-9]+\.[0-9]+\.[0-9]+$/p' | sort -r  | sed '1q')
if [ ! -z "$node" ]; then
    export NODE_PATH="$nvm_path/$node/bin"
else
    export NODE_PATH=""
fi
# export PYTHONPATH="$WORK/PPE/tensorflow-api/models/research:$WORK/PPE/tensorflow-api/models/research/slim:$WORK/PPE/tensorflow-api/models:$PYTHONPATH"
export PYTHONPATH="$WORK/PPE/workplace/train/images/models/research:$WORK/PPE/workplace/train/images/models/research/slim:$WORK/PPE/workplace/train/images/models:$PYTHONPATH"
export JDK_HOME="/usr/lib64/openjdk-11"
export JAVA_HOME="$JDK_HOME"
# TODO update this path to remove cargo
export PATH="$PATH:$JAVA_HOME/bin:$HOME/.cargo/bin:$NODE_PATH"

export CARGO_HOME="$PROGRAMS/rust/cargo"
export RUSTUP_HOME="$PROGRAMS/rust/rustup"

export GOPATH=$PROGRAMS/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
#======================================
#
#WINE
export DISPLAY=:0

#fzf
export FZF_COMPLETION_TRIGGER='**'
# Options to fzf command
# export FZF_DEFAULT_COMMAND="find * -type f -not -path "
# export FZF_DEFAULT_COMMAND="find * -type f build -not \( -path miniconda3/* -prune \) -not \( -path node_modules/* -prune \) "
export RG_DEFAULT="rg --files --no-heading --smart-case --follow -g '!{**/node_modules/*,*.class,**/.git/*,miniconda3/*,**/*~,plugged/**,env,envs,__pycache__,libs,lib,.wine,.npm,.icons,.vscode,*/nvim/backups,.emacs.d/**,.cache,**/undodir/*}' --"

# not working for fd
# excluded='{node_modules,*.class,.git,**/*~,plugged,__pycache__,.wine,.npm,.icons,*/nvim/backups,.emacs.d,.cache,undodir}'
export FD_DEFAULT="fd --follow --exclude $excluded"
export FZF_DEFAULT_COMMAND=$RG_DEFAULT
# export FZF_DEFAULT_OPTS='--bind=ctrl-e:up,ctrl-n:down'
# to unhide preview window, change to --preview-window=right:hidden:wrap"
# for prompt at the bottom, change layout to "default"
export FZF_DEFAULT_OPTS=" --height=15 --layout=reverse --multi --bind=alt-e:up,alt-n:down,alt-t:toggle-preview,ctrl-a:select-all+accept --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) > /dev/null | head -300' --preview-window=right:wrap"
export FZF_ALT_C_COMMAND="${FZF_DEFAULT_COMMAND} --type directory"
# alt r -> cd into selected dir
# ctrl t -> paste selected into command line(multiple)
# ctrl r -> paste command from history
#colors less
#export  LESS_TERMCAP_mb=$'\e[1;31m'
#export  LESS_TERMCAP_md=$'\e[1;31m'
#export  LESS_TERMCAP_me=$'\e[0m'
#export  LESS_TERMCAP_se=$'\e[0m'
#export  LESS_TERMCAP_so=$'\e[1;44;33m'
#export  LESS_TERMCAP_ue=$'\e[0m'
#export  LESS_TERMCAP_us=$'\e[1;32m'

export GROFF_NO_SGR=1                  # for konsole and gnome-terminal
export LESS_TERMCAP_mb=$( printf '\E[01;31m')
export LESS_TERMCAP_md=$( printf '\E[01;31m')
export LESS_TERMCAP_me=$( printf '\E[0m')
export LESS_TERMCAP_se=$( printf '\E[0m')
export LESS_TERMCAP_so=$( printf '\E[01;47;34m')
export LESS_TERMCAP_ue=$( printf '\E[0m')
export LESS_TERMCAP_us=$( printf '\E[01;32m')
