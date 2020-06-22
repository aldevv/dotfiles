# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
# only source if you dont login from a terminal
source ~/.zprofile

export ZSH="/home/solus/.oh-my-zsh"
export TERM="st"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"
#ZSH_THEME="agnoster"

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

#functions
#to open man in vim
function man(){
    for arg in "$@"; do
        nvim -c 'execute "normal! :let no_man_maps = 1\<cr>:runtime ftplugin/man.vim\<cr>:Man '"${arg}"'\<cr>:wincmd o\<cr>"'
    done
}



# Add wisely, as too many plugins slow down shell startup.
# # in archlinux put the archlinux plugin!
plugins=(git colemak lol z node npm vscode extract systemd)
#should add docker if i use it someday
#https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vscode

source $ZSH/oh-my-zsh.sh

# setup dotrepo
#
#git init --bare $HOME/Documents/DotFilesRepository
#dotrepo config --local status.showUntrackedFiles no

# Aliases 
alias station="~/.local/bin/Station-1.65.0-x86_64.AppImage"\
	vim="nvim"\
	todoist="cd ~/Downloads/P/todoist && make up"\
    dotrepo="git --git-dir=$HOME/Documents/DotFilesRepository/ --work-tree=$HOME"\
	ma="make && sleep 0.5 ./a.out"\
	uncompress='tar xvzf'\
	code='code-oss'\
	dl='cd ~/Documents/Learn'\
	dlt='cd ~/Documents/Learn/typing'\
	dlc='cd ~/Documents/Learn/C/Suckless'\
	dc='cd ~/Documents/classes'\
	dlo='cd ~/Documents/Learn/myos4/chmaquina'\
	dlw='cd ~/Documents/Learn/Web/course/test'\
	lat='cd ~/Documents/testing/AI/sudoku-detection; conda activate AI'\
	cf='cd ~/.config'\
    cfe='vim ~/.emacs.d/init.el'\
	cfz='vim ~/.zshrc'\
	cfp='vim ~/.zprofile'\
	cfb='vim ~/.bashrc'\
	cfx='vim ~/.Xresources'\
	cfv='vim ~/.config/nvim/init.vim'\
	cfk='vim ~/.config/sxhkd/sxhkdrc'\
	pydocs='~/Documents/myScripts/python_documentation.sh'\
	ms='cd ~/Documents/myScripts/'\
	pkg='sudo eopkg'\
	xi='sudo vim /etc/X11/xinit/xinitrc'\
	doc='cd /usr/share/doc'\
	apps='cd /usr/share/applications'\
	cs='cd ~/Documents/classes'\
	D='cd ~/Downloads'\
	d='cd ~/Documents'\
	xa='sudo /opt/lampp/manager-linux-x64.run'\
	djan='cd /home/solus/dev/trydjango/src'\
	corona='/home/solus/dev/corona/get_info'\
	tord='/home/solus/.local/share/torbrowser/tbb/x86_64/tor-browser_en-US/Browser/Downloads'\
	sac='source env/bin/activate'\
	dev='cd ~/dev'\
	ven='wine .wine/drive_c/Program\ Files/Vensim/venPLE32.exe'\
	work='cd ~/dev/Work'\
	ds='dotrepo status'\
	daa='dotrepo add'\
	dau='dotrepo add -u'\
	dc='dotrepo commit -m'\
	dgp='dotrepo push origin master'\
	
	#python='python3'\

# User configuration

# so you can use backspace after esc
bindkey -v '^?' backward-delete-char

bindkey -v
# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Vi style:
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

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
source /home/solus/Programs/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
