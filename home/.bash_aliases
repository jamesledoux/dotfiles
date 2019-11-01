alias rdpsql='psql -U django_raddash -d radiology'
alias r2dpsql='psql -U django_raddash -d radiology2'
alias la='ls -al'
alias l.='ls -dF .[a-zA-Z0-9]*'
alias ll='ls -ltBr'
alias ls='ls -B'
alias snano='sudo nano -BIA -C /tmp/nano/root'
alias du='du -h'
alias df='df -h'
alias konq='konqueror'
alias matlab='matlab -nosplash'
alias gotosleep='sudo /etc/acpi/sleep.sh force'
alias xpdf='acroread'
alias vnc8='vnc4server -cc 3 -depth 24 -geometry 1500x1000'
alias vnc='vnc4server -geometry 1500x1000'
alias cdlasttrash='cd ~/tmp/trash_myrm/`cat ~/tmp/trash_myrm/pointer`'
alias lslasttrash='ls ~/tmp/trash_myrm/`cat ~/tmp/trash_myrm/pointer`'
alias itksnap='/home/jledoux/install/itksnap-2.0.0-20091117-Linux-x86_64/bin/itksnap'
alias supgrade='sudo apt-get update && sudo apt-get upgrade'
alias sapache2restart='sudo /etc/init.d/nginx restart && sudo /etc/init.d/apache2 restart'
alias aptin='sudo apt-get install'
alias aptrm='sudo apt-get remove'

alias root='root -l'
## alias del='/bin/mv -t ~/.trash/ "$*" '
#alias del='/bin/rm'
#alias rm='~/local/bin/myrm'
#alias oldrm='/bin/rm'
alias rrm='/bin/rm'
alias shred='/usr/bin/shred -u -z -n50'
alias oldshred='/usr/bin/shred'
= () { echo "scale=4; ${*}" | bc ; }

alias e='TERM=xterm-vt220 /usr/bin/emacs -nw'
alias emacs='TERM=xterm-vt220 /usr/bin/emacs -nw'
alias enw='TERM=xterm-vt220 /usr/bin/emacs -nw'
em () { TERM=xterm-vt220 /usr/bin/emacs -g 100x65 ${*} & }
alias semacs='sudo TERM=xterm-vt220 /usr/bin/emacs'
function calc () {
    awk "BEGIN { print $* ; }"
}

calc2 () # Integer-only command-line calculator
{
    printf "$(($*))\n"
}


#test () { echo 'scale 4; $@' ;}
gpgclose () { gpg -r jledoux -e $1 && shred $1 ;}

alias grep='grep --color'
alias grepn='grep --color -n'
alias lsnew="ls -alh --time-style=+%D | /bin/grep `date +%D`"
alias sudolast='sudo !!'
alias ps?="ps aux | grep"

alias sgoogle-chrome="sudo su webdata -c 'google-chrome --incognito --proxy-server=socks://localhost:13686' &"
alias wvact="source /django/weron2/venv/bin/activate"
alias vact="source /django/venv18/bin/activate"
