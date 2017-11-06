# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignorebothgongneng

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


#
# custom alias by moon
#
#alias kill-contains-all=" ps -ef|grep $1 |grep -v grep|awk  {print "kill -9 " $2}"
alias echo-my="echo $1"
alias hexdump-readble="hexdump -e '8/1 \"%02X \"\"\t\"\" \"' -e '8/1 \"%c\"\"\n\"'"
alias rmr="rm -r"
alias wds="wd -s"
alias ssh-152="ssh nslabdns@172.29.152.152" 
alias ssh-ali="ssh root@59.110.70.78"
alias ssh-dns-server-253="ssh root@222.194.15.253"
alias ssh-dns-server-254="ssh root@222.194.15.254"
alias ssh-lab="ssh moon@172.29.153.168"
alias ssh-huabei="ssh root@114.215.223.16"
alias ssh-rdnsd="ssh root@119.23.134.139"
alias llm="ll --block-size=M"
alias lsm="ls --block-size=M"
alias mysql-local="mysql -h 127.0.0.1 -u root -D cache_poison_watcher -p"
alias mysql-ali="mysql -h 59.110.70.78 -u root -D dns_detect -p"
alias mysql-labdb="mysql -h 172.26.253.3 -u root -p "
alias mysql-SE="mysql-labdb -D keywords"
alias mysql-malicious-domain="mysql-labdb -D malicious_domain_sys"
alias mysql-myself="mysql-labdb -D zhangnan"
alias mysql-server12="mysql -h 106.15.42.12 -u root -D cache_poison_watcher -p"
alias mendeley="~/Desktop/softwares/mendeleydesktop-1.17.9-linux-x86_64/bin/mendeleydesktop &> /dev/null &"
alias rdm="cd ~/Desktop/softwares/RedisDesktopManager/bin/linux/release && ./rdm &> /dev/null & "
alias ssh-208="ssh root@116.62.234.208"
alias ssh-197="ssh root@39.108.210.197"
alias ssh-108="ssh root@118.190.146.108"
alias ssh-12="ssh root@106.15.42.12"

alias ssh-temp-1-25="ssh root@47.95.37.25"
alias ssh-temp-2-195="ssh root@47.94.37.195"
alias ssh-temp-3-57="ssh root@47.94.38.57"

alias ssh-temp-5-89="ssh root@47.93.116.89"
alias ssh-temp-4-147="ssh root@47.94.36.147"

alias ssh-myali="ssh root@119.23.46.130"

# for short time
#alias lsys="/home/moon/workplace/label-system/lsys"
#alias qs="/home/moon/workplace/quick-search/qs"
