# .bashrc
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
PS1="$COLOR2[$COLOR4\u@\h$COLOR3:$COLOR5\w$COLOR2]$COLOR5$COLOR2\n$COLOR2[$COLOR4\$$COLOR2>$COLOR5 "
PS2=" $COLOR2$COLOR1$COLOR3|$COLOR5 "
PS4=" $COLOR3+$COLOR5 "
#PROMPT_COMMAND="date '+%I:%M%P'";

#
# Alias
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
export DOCKHAND_PATH=$PROJECTS/CP/dockhand
export PATH=$PATH:$HOME/bin:$HOME/local/lps-3.3.3/bin:/usr/lib/python2.4/site-packages/django/bin:$HOME/local/adobeair_linux_sdk_a1_033108/bin:$PROJECTS/ISG/danbury_weather/bin:$DOCKHAND_PATH/bin
export CDPATH=.:~:/mnt:/:/etc/:/var:/usr
export HISTIGNORE="&:ls:[bf]g:exit"
export MANPATH=$MANPATH:/opt/gnome/man
export EDITOR=vim
export CVSROOT=:ext:dnewman@cvs.sine-wave.com:/usr/local/swcvs
export CVS_RSH=ssh
export GOOGLE_LICENCE_KEY=Qiec/P9QFHIE7ofSq7MKF1OxahPLxlV1
export JAVA_HOME="/usr/lib/jvm/java-6-sun-1.6.0.03"
export TASKMASTER_PATH=$HOME/Dropbox/Projects/tm
#perl -e 'push @INC, "$ENV{\"DOCKHAND_PATH\"}/lib"'

#
# Nautilus Utility Library
#
export NAUTILUS_UTILITY_LIB_PATH=~/lib/utility
perl -e 'push @INC, "/home/ikt0me/lib/utility"'


#
# Shell Options
#
shopt -s cdspell
shopt -s cmdhist
shopt -s dotglob
