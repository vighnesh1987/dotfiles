export BASH_CONF="bashrc"
if [ -f ~/.databasedotcom.secrets ]; then
   source ~/.databasedotcom.secrets
fi
## HEY LET'S TEST SOME IOS APPS OUT
# Infinite history for Bash
# http://stackoverflow.com/questions/10374019/how-to-get-infinite-command-history-in-bash
export HISTSIZE="GOTCHA"


#useful stuff for git
export EDITOR='vim -f'
export PAGER='less'
export GIT_CEILING_DIRECTORIES="/home"
function branchname { git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/[\1]/'; }
alias ga='git add'
alias gps='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias gca='git commit -a'
alias gb='git branch'
alias gco='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpl='git pull'
alias gcl='git clone'
alias gsb='git show-branch'

# tmux aliases
alias lstmux='tmux list-sessions'
alias atmux='tmux attach -t'
alias ntmux='tmux new-session -d -s'
alias tmux='TERM=xterm-256color tmux'

# valgrind
alias valgrind="valgrind --leak-check=full --show-reachable=yes -v"

# Convenience shortcuts
alias ..='cd ..'
alias ls="ls -G"
alias ll="ls -al"

# search and find commands
alias gg='grep -rn --color=always --exclude={*.o,tags*,flat_storage*}' #query
alias ggr='gg --exclude-dir ".idea" --exclude-dir "vendor" --exclude-dir "tmp" --exclude-dir "log" --exclude-dir ".git"'
alias fdir='find . -maxdepth 1 -name ' # find files matching pattern in current dir.
alias fswp='fdir ".*.sw*"'
alias frec='find . -name ' # find files matching pattern in current dir.
alias frswp='frec ".*.sw*"'

# better colors - copied over from ec2
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';

# i <3 my prompt
export PS1='\[\e[1;36m\][\t] \h:\w$(branchname) \[\e[0m\]'
#export PS1='[$%#>] '
export HISTCONTROL=erasedups

# bash auto-completion by history
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# generate strings
randstring() {
  local l=$1
    [ "$l" == "" ] && l=16
    tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}

# This sets the tab titles
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}\007"'

#Use MacVim instead of vim
#alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias vim="mvim -v"

extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

# LeanData specific
alias ldapp='cd ~/LeanData/ld-server/'
#ldapp
# RVM
#rvm use jruby
#rvm use 1.9.3


# Alternative to watch
botch() {
    while true; do
        (echo -en '\033[H'
            CMD="$@"
            bash -c "$CMD" | while read LINE; do 
                echo -n "$LINE"
                echo -e '\033[0K' 
            done
            echo -en '\033[J')
        sleep 2 
    done
}

# Vi Key bindings
#set -o vi
## ^p check for partial match in history
#bind -m vi-insert "\C-p":dynamic-complete-history
## ^n cycle through the list of partial matches
#bind -m vi-insert "\C-n":menu-complete
## ^l clear screen
#bind -m vi-insert "\C-l":clear-screen




export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

