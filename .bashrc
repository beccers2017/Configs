if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

[ -f ~/.git-completion.bash ] && . ~/.git-completion.bash

[ -f ~/.git-prompt.sh ] && . ~/.git-prompt.sh

PS1='\[\e[96m\][\u@`hostname`]\[\e[93m\]$(__git_ps1 "[%s]")\n\[\e[92m\]\w\[\e[91m\]>\[\e[00m\]'

shopt -s checkwinsize
shopt -s cdspell
shopt -s extglob
shopt -s dotglob
shopt -s nocaseglob
shopt -s lithist
shopt -s globstar

export PROMPT_COMMAND='history -a'

export HISTFILESIZE=1000000
export HISTSIZE=1000000
export HISTTIMEFORMAT="%d/%m/%y %T "
export HISTCONTROL=ignorespace:ignoredups
shopt -s histappend
shopt -s cmdhist

export EDITOR=vim
export VISUAL=vim

alias c='clear'
alias e='exit'
alias p='pwd'
alias cd..='cd ..'
alias ..='cd ..'
alias l='ls --color=auto'
alias ll='ls -la'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias yum='sudo yum'
alias chmod='sudo chmod'
alias lvdisplay='sudo lvdisplay'
alias vgdisplay='sudo vgdisplay'
alias pvdisplay='sudo pvdisplay'
alias empty='sudo trash-empty'
alias ...='cd ../..'
alias ....='cd ../../../../'
alias pp='ps axuf | pager'
alias ,,='cd ..'
alias cache='sudo fc-cache -f -v'
alias la='ls -lAFh'

ex() {
  if [ -f $1 ]; then
    case $1 in
      *.tar.bz2) tar xjf $1 ;;
      *.tar.gz) tar xzf $1 ;;
      *.bz2) bunzip2 $1 ;;
      *.rar) unrar x $1 ;;
      *.gz) gunzip $1 ;;
      *.tar) tar xf $1 ;;
      *.tbz2) tar xjf $1 ;;
      *.tgz) tar xzf $1 ;;
      *.zip) unzip $1 ;;
      *.Z) uncompress $1 ;;
      *.7z) 7z z $1 ;;
      *) echo "'$1' cannot be extracted via ex()"  ''
    esac
  else
    echo "'$1' is not a valid file"
  fi
}
