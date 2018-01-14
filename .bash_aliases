#Variables
export MINICOM="--baudrate 9600 --device /dev/ttyS4"

alias ll="ls -la --color=auto"
alias nn="nano -w"
alias rs="rsync -aHv"
alias tq="tc -s -d qdisc show"
alias tqd="tc -s -d qdisc show dev"
alias tf="tc -s -d filter show"
alias tfd="tc -s -d filter show dev"
alias tk="tc -s -d class show"
alias tkd="tc -s -d class show dev"
alias tmx="tmux attach"

tnew() {
  tmux new-session -As `basename $PWD`
}

deployrc()
{
  ssh-copy-id ${1}
  scp -r {.tmux.conf,.zshrc,.vimrc} ${1}:
}

ssp () {
  ssh -p799 admin@${1}
}

ssa () {
  ssh admin@${1}
}

t () {
  telnet ${1}
}
