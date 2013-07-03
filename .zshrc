# compinit
autoload -U compinit && compinit

# colors autoload
autoload -U colors && colors

# promptinit
autoload -U promptinit && promptinit

# Kernel type set
KERNEL="`uname`"

# Set up the PS1(PROMPT)
#PS1='%/ %m %n %l %h %* %w %W %D $ '
PS1="${KERNEL}:%F{yellow}%n%F{cyan}:%F{green}%l%F{cyan}@%F{magenta}%m %F{cyan}[%F{white}%K{blue}%/%K%F{cyan}]%F{normal}
%K{green}%F{black}%D%F{normal}%K{normal} %F{blue}[%F{normal}%*%F{blue}]%F{cyan}$ %F{normal}%K{normal}"
#PS1="%{$fg[purple]%}%n%{$fg[cyan]%}:%{$fg[green]%}%l%{$fg[cyan]%}@%{$fg[brown]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%'$ "
#PS1=$'%{\e[0;36m%}[%{\e[0;35m%}%n%{\e[0;36m%}@%{\e[33;40m%}%m %{\e[0;37m%}%{\e[2;44m%}%d%{\e[0;36m%}]$%{\e[0m%} '
PS2=$'%{\e[0;35m%}%{\e[37;45m%}%d%{\e[0;36m%}->%{\e[0m%} '
export PS1 PS2

# language
export LANG=ja_JP.UTF-8

# Editor
export EDITOR=/usr/bin/vim

# wordchars
export WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"

# screen
if [ ${SHLVL} -eq 1 ]; then
	/usr/local/bin/tmux
fi

# Function
function history-all() { hostory -E 1 }
funtcion TRAPZERR() { echo "exit:$?" }

# history
HISTFILE=${HOME}/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt extended_history
setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_ignore_all_dups
function history-all

setopt no_prompt_cr
setopt auto_pushd

# dvorak
setopt dvorak

# key bind
set -o emacs

# alias
alias vi='vim'
alias ls='ls -FG'
alias ll='ls -la'
alias pd='popd'

zstyle ':completion:*' list-colors ''
