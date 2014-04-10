# Kernel type set
KERNEL="`uname`"

if [ "${KERNEL}" = "Linux" ]; then
	export PATH="${PATH}"
else
	export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:/usr/local/sbin:$PATH:/usr/texbin:$HOME/bin"
	export MANPATH="$(brew --prefix coreutils)/libexec/gnuman:$MANPATH"
fi

autoload -U compinit && compinit
autoload -U colors && colors
autoload -U promptinit && promptinit
autoload -Uz zmv
autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr '%F{green}●%f'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}●%f'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{red}:%f%F{yellow}%r%f'
zstyle ':vcs_info:*' enable git svn
precmd() { vcs_info }

# Set the PS1(PROMPT)
#PS1="%F{10}(%B%f%F{6}${KERNEL}%f%b%F{10})%f:%(!.%B%F{red}.%F{3})%n%b%f:%F{green}%l%f@%F{11}%m %F{cyan}[%F{15}%K{17}%/%b%F{cyan}]%f
#%D %F{10}[%f%F{7}%*%f%F{10}]%(!.%B%F{red}#%b.%F{cyan}$) %f%k"
PROMPT="%F{10}(%B%f%F{6}${KERNEL}%f%b%F{10})%f:%(!.%B%F{red}.%F{3})%n%b%f:%F{green}%l%f@%F{11}%m %F{cyan}[%F{15}%K{17}%/%b%F{cyan}]%f
%F{10}[%f%D %F{7}%*%f%F{10}]%(!.%B%F{red}#%b.%F{cyan}$) %f%b%k%{$reset_color%}"

# Right side
#RPROMPT='%F{cyan}%D{%e.%b.%y %H.%M}%f%{$reset_color%}'
RPROMPT=$'%(?..[ %B%F{red}%?%b ])%{$reset_color%}'

PS2=$'%{\e[0;35m%}%{\e[37;45m%}%d%{\e[0;36m%}->%{\e[0m%} '
export PS1 PS2

# locale
if [ `id -u` -eq 0 ]; then
#	export LANG=C
	export LANG=en_US.UTF-8
else
#	export LANG=ja_JP.UTF-8
	export LANG=en_US.UTF-8
fi

export EDITOR=/usr/bin/vim

# Wordchars: Delete word to press "C-w"
# e.g. ls /usr/local -> ls /usr/ -> ls /
#export WORDCHARS="*?_-.[]~=&;!#$%^(){}<>"
export WORDCHARS='*?-[]~=/&;!#$%^(){}<>'
export WORDCHARS=${WORDCHARS//[\/]}

# Show command return code when command exit.
funtcion TRAPZERR() { echo "exit:$?" }

# --------------- History ---------------
HISTFILE=${HOME}/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt extended_history
setopt share_history
#setopt hist_ignore_space
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_no_store
function histall() { history -E 1 }
# incremental search
#bindkey "^R" history-incremental-search-backward
#bindkey "^S" history-incremental-search-forward

setopt extended_glob
setopt braceexpand
setopt no_prompt_cr
setopt auto_pushd
setopt pushd_ignore_dups
setopt auto_list
setopt list_packed
# put slash'/' when case directory.
#setopt mark_dirs
setopt auto_remove_slash
setopt auto_param_slash
setopt nonomatch
setopt prompt_subst

# dvorak
setopt dvorak

# Brace Expansion: e.g. $ echo {a-z} -> a b c d e f g h i j k l m n
setopt BRACE_CCL

# key bind
#set -o emacs
bindkey -e	#emacs
#bindkey -v	#vi

# alias
alias vi='vim'
alias ls='ls -F --color'
alias ll='ls -la'
#alias pd='popd'
alias less='less -R'
alias ansifilter='sed "s,\x1B\[[0-9;]*[a-zA-Z],,g"'
export GREP_OPTIONS="--color=auto"

# less(1) Colors
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
#export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_so=$(tput bold; tput setaf 1)    # Red color
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

export GROFF_NO_SGR=1

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:default' cache-path ~/.zsh/cache
zstyle ':completion:*::::' completer _expand _complete _match _approximate
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
zstyle ':completion:*:commands' rehash 1

eval `dircolors ~/.zsh/DIR_COLORS`

export TERM="screen-256color"
# screen
if [[ -z ${SSH_CLIENT} && -z ${SSH_TTY} && ! -z ${DISPLAY} && \
  ( -x /usr/local/bin/tmux || -x /usr/bin/tmux ) && ! ${USER} == "root" ]]; then
#	[[ `ps -ef | grep -v grep | grep tmux | wc -l` = 0 ]] && tmux
	[[ $TMUX == "" ]] && tmux
fi
