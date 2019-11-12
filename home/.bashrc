# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
#export HISTCONTROL=ignoredups
#export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=10000000                   # big big history
export HISTFILESIZE=10000000               # big big history
shopt -s histappend                      # append to history, don't overwrite it
shopt -s histreedit
shopt -s histverify
HISTFILE=~/.bash_unlimited_history
HISTTIMEFORMAT="%FT%T  "


#export GLOBIGNORE='*~:*.pyc'
# Save and reload the history after each command finishes

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" -a -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
# case "$TERM" in
# xterm-color)
#     PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#     ;;
# *)
#     PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#     ;;
# esac
#PS1='\[\e[1;37m\e[42m\]\h\[\e[m\]:\[\e[1;34m\]\w\[\e[m\]\$ '
#PS1='\D{%a %b %d, %H:%M:%S} \[\e[1;31m\]\h\[\e[m\]:\[\e[1;34m\]\w\[\e[m\]\n\[\e[0;33\!\e[m\] \$ '
PS1="\[\e[1;31m\]\h\[\e[m\]:\[\e[1;34m\]\w\[\e[m\] \[\e[0;32m\D{%a %b %d, %H:%M:%S}\e[m\]  (\[\e[0;33m\!\e[m\])\n\$ "

# while getopts :
# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    [ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
    [ -e "$DIR_COLORS" ] || DIR_COLORS=""
    eval "`dircolors -b $DIR_COLORS`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

# some more ls aliases
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#fi


# This line was appended by KDE
# Make sure our customised gtkrc file is loaded.
# (This is no longer needed from version 0.8 of the theme engine)
# export GTK2_RC_FILES=$HOME/.gtkrc-2.0

export PATH=$PATH:/sbin/:$HOME/local/bin:$HOME/.local/bin:/snap/bin
export EDITOR=vi

if [[ -f $HOME/.localbashrc ]]; then
    . $HOME/.localbashrc
fi
