# .bashrc

#
# Functions
#

function git_branch {
	ref=$(git symbolic-ref HEAD 2> /dev/null) || return
	echo "git:"${ref#refs/heads/}
}

#
# Prompt Customization
#

GRAD1=`tty|cut -d/ -f3-4`
COLOR1="\[\033[1;39m\]"
COLOR2="\[\033[1;36m\]"
COLOR3="\[\033[1;30m\]"
COLOR4="\[\033[0;36m\]"
COLOR5="\[\033[0;39m\]"
#PS1="[\u@\h:\w]\n[\$> "
#PS2=" | "
PS1="$COLOR2[$COLOR4\u@\h$COLOR3:$COLOR5\w$COLOR2]$COLOR5$COLOR2\n$COLOR2[$COLOR4\$(git_branch)\$$COLOR2>$COLOR5 "
PS2=" $COLOR2$COLOR1$COLOR3|$COLOR5 "
PS4=" $COLOR3+$COLOR5 "
#PROMPT_COMMAND="date '+%I:%M%P'";

#
# Alias'
# 

alias ls='ls -sFk -h --color=auto'
alias dir='dir --color=auto -1'
alias du='du -h'
alias df='df -hT'
alias r='fc -s'
alias mime='file -i'
alias rm='rm -r'
alias cp='cp -r'

#
# Envorionment Variables
#

export PROJECTS=$HOME/Projects
export PATH=$PATH:$HOME/bin:/var/lib/gems/1.8/bin
export CDPATH=.:~:/mnt:/:/etc/:/var:/usr
export HISTIGNORE="&:ls:[bf]g:exit"
export MANPATH=$MANPATH:/opt/gnome/man
export EDITOR=vim

#
# Shell Options
#

shopt -s cdspell
shopt -s cmdhist
shopt -s dotglob
