# $Id: .zshrc 383 2011-12-07 11:07:22Z boogie $

# History settings
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# Prompt settings
PROMPT="%(!.%F{red}.%F{blue})%n%f@%F{green}%m%f %F{yellow}%~%f %# "
RPROMPT="%(0?..[%F{red}%?%f])"

case $COLORTERM in
  gnome-terminal)
    export TERM=xterm-256color
  ;;  
esac  

case $TERM in
  xterm*|rxvt*)
                precmd () {print -Pn "\e]0;%n@%m:%~\a"}
        ;;
esac

# Environment
export PATH=/$HOME/bin:$PATH
export EDITOR="vim"
export PAGER="less"
export BLOCKSIZE="K"

# Locale section
export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_CTYPE="ru_RU.UTF-8"
export LC_NUMERIC="ru_RU.UTF-8"
export LC_TIME="ru_RU.UTF-8"
export LC_COLLATE="ru_RU.UTF-8"
export LC_MONETARY="ru_RU.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_PAPER="ru_RU.UTF-8"
export LC_NAME="ru_RU.UTF-8"
export LC_ADDRESS="ru_RU.UTF-8"
export LC_TELEPHONE="ru_RU.UTF-8"
export LC_MEASUREMENT="ru_RU.UTF-8"
export LC_IDENTIFICATION="ru_RU.UTF-8"
export LC_ALL="ru_RU.UTF-8"

# Host/end keys fix
bindkey -e
bindkey "^[[H" beginning-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[4~" end-of-line
bindkey "^[[3~" delete-char

# Misc settings
zstyle :compinstall filename "~/.zshrc"

autoload -Uz compinit
compinit

autoload -U select-word-style
select-word-style bash

setopt appendhistory
setopt noclobber
setopt histignoredups
setopt hist_allow_clobber
setopt extended_history
setopt hist_reduce_blanks
setopt nobeep

unsetopt automenu

# Aliases
case `uname` in
        FreeBSD)
                alias ls="ls -FG"
                alias l="ls -Ahl"
                alias ll="l -To"
        ;;
        Linux)
                # Colors!
                if [[ -f ~/.shell_colors ]] && {
                        source ~/.shell_colors
                }
                alias ls="ls -F --color=auto"
                alias l="ls -Ahl"
                alias grep="grep --color=auto"
                if [ -r ${HOME}/.bash_aliases ] && source ${HOME}/.bash_aliases
        case `uname -r | cut -d "-" -f2` in
                gentoo)
                        autoload -U compinit promptinit
                        compinit
                        promptinit; prompt gentoo
                ;;
        esac
        ;;
esac

alias p="pwd"
alias h="fc -ldD"
alias j="jobs -l"
alias pu="pushd"
alias po="popd"
alias d="dirs"
alias tmx="tmux attach -d"
alias sush="sudo -E -s"
alias sued="sudoedit"
alias rr="rm -r"
alias zsh-reload=". ~/.zshrc"

pid () {
    ps aux | grep "${1}" | grep -v "grep ${1}"
}

agent-sock-refresh () {
  if [ -n $TMUX ]; then
    newsock=`tmux showenv | grep ^SSH_AUTH_SOCK | cut -d = -f 2`
    if [ -n $NEW_SSH_AUTH_SOCK ] && [ -S $NEW_SSH_AUTH_SOCK ]; then 
      export SSH_AUTH_SOCK=$newsock
    fi
  fi
}

# Include .zshrc.local if it does exist
[ -r ${HOME}/.zshrc.local ] && . ${HOME}/.zshrc.local
