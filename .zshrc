#######################################################################
# PATH STUFF
# ruby stuff
export PATH="$PATH:$HOME/.rvm/bin"
# gillnet_repo settings
export GOPATH="$HOME/gillnet_repo/go"
#export GOBIN="$GOPATH/bin"
export PATH="$(go env GOROOT)/bin:$GOPATH/bin:$PATH"
export PATH="$(go env GOTOOLDIR):$PATH"
export DOCKER_HOST='tcp://localhost:2375'

# psql binary
PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.5/bin
 [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
#######################################################################
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="tjkirch"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/git/bin:/usr/texbin"
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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias 'ls'='ls -AF -G'
alias 'git st'='git status'

alias 'cls'='clear'

alias 'chk'='make check'
alias 'int'=intTest
alias 'got'=gotest
alias 'last'='echo $?'

alias 'moo'='fortune -s computers | cowsay'

agHistory(){
	if [ ! -z "$1" ]
	then
		echo 'history | ag '$1
		history | ag $1
	fi
}
alias 'agh'=agHistory

gotest(){
	if [ ! -z "$1" ] && [ ! -z "$2" ]
	then
		echo 'Unit testing '$2' in '$1
		go test $1 -test.run=$2
	elif [ ! -z "$1" ]
	then
		echo 'Unit testing package: '$2
		go test $1
	else
		echo 'Unit testing all packages'
		go test ./...
	fi
}

intTest(){
	if [ ! -z "$1" ] && [ ! -z "$2" ]
	then
		echo 'Int testing '$2' in '$1
		./docker-integration-test.sh  $1/integration -integration -test.run="$2"
	elif [ ! -z "$1" ]
	then
		echo 'Int testing package: '$1
		./docker-integration-test.sh  $1/integration -integration -p=1
	else
		echo 'Int testing all packages'
		make integration-test
	fi
}

# Make gitk nicer
# alias gitk="/usr/bin/wish $(which gitk)"

alias gb='git branch'
alias gs='git status'
alias gc='git checkout'
alias ga='git add'
alias gd='git diff'
alias gdc='git diff --cached'

alias refresh_db="$GOPATH/../script/yml2env.sh $GOPATH/bin/pgtos3cmd -action=restore"
alias pg='pgcli gillnet_prod'
alias cwtcmd='$GOPATH/../script/yml2env.sh cwtcmd'

alias vi='nvim'

# alias tl='tmux list-sessions'
# alias ta=tmuxAttachFunc
# // attaches to a tmux session numbered given param
# tmuxAttachFunc(){
# 	tmux attach-session -t $1
# }

# Vi mode http://dougblack.io/words/zsh-vi-mode.html
# bindkey -v
# bindkey '^R' history-incremental-search-backward
# export KEYTIMEOUT=1

alias gl='git log -all --decorate --oneline --graph'
