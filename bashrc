export EDITOR='vim -f'
export PAGER='less'

####### bash history
# infinite history for Bash
# http://stackoverflow.com/questions/10374019/how-to-get-infinite-command-history-in-bash
export HISTSIZE="GOTCHA"
# skip duplicate items
export HISTCONTROL=erasedups

####### git
# controls the behavior of searching for a .git directory. If you access directories
# that are slow to load (such as those on a tape drive, or across a slow network connection),
# you may want to have Git stop trying earlier than it might otherwise, especially
# if Git is invoked when building your shell prompt.
export GIT_CEILING_DIRECTORIES="/home"
alias ga='git add'
alias gps='git push'
alias gpl='git pull'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gc='git commit'
alias gb='git branch'
alias gco='git checkout'
alias gcl='git clone'
alias gsb='git show-branch'

####### tmux
alias lstmux='tmux list-sessions'
alias atmux='tmux attach -t'
alias ntmux='tmux new-session -d -s'
alias tmux='TERM=xterm-256color tmux'

###### aliases
alias ..='cd ..'
alias ls="ls -G"
alias ll="ls -al"

###### grep
export GREP_OPTIONS='-rn --color=always'
# with common exclude patterns
alias grex='grep --exclude={*.o,tags*,flat_storage*} --exclude-dir ".idea" --exclude-dir "vendor" --exclude-dir "tmp" --exclude-dir "log" --exclude-dir ".git"'

# better colors
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';

###### misc
# bash auto-completion by history
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# this sets the tab titles
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}\007"'

# use MacVim instead of vim, if it exists
# http://stackoverflow.com/questions/592620/check-if-a-program-exists-from-a-bash-script
if hash mvim 2> /dev/null; then
  alias vim="mvim -v"
fi

# extract all sorts of compressed files
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

# alternative to watch
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

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
# Enable Vi key bindings
set -o vi
# Enable Vi key bindings
set -o vi

#If you really need to use these commands with their normal names, you
#can add a "gnubin" directory to your PATH from your bashrc like:

export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"

#Additionally, you can access their man pages with normal names if you add
#the "gnuman" directory to your MANPATH from your bashrc as well:

export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Added by rege as per https://our.intern.facebook.com/intern/dex/installing-java-8/
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export PATH=${JAVA_HOME}/bin:${PATH}

# mercurial bookmark
if [ -f /opt/facebook/share/scm-prompt ]; then
  source /opt/facebook/share/scm-prompt
fi

# Show the current bookmark or branch
export PS1='\u@\h:\W $(_dotfiles_scm_info)\$ '

function parse_hg_branch {
  if [[ -n $(_dotfiles_scm_info) ]]; then
    # wrap in parens
    echo "$(_dotfiles_scm_info)"
  fi
}

# Show current hg bookmark
function hgproml {
  # here are a bunch of colors in case
  # you want to get colorful
  local        BLUE="\[\033[0;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  local LIGHT_BLUE="\[\e[1;36m\]"
  local RESET_COLOR="\[\033[0m\]"

export PS1="\
$LIGHT_BLUE[\t] \u:$LIGHT_GREEN\w$GREEN\$(parse_hg_branch)$LIGHT_BLUE\
\$$RESET_COLOR "
PS2='> '
PS4='+ '
}

###### prompt
export PS1='\[\e[1;36m\][\t] \h:\w$(branchname) \[\e[0m\]'

hgproml

export PS1="\n[Exit: \[\033[1;31m\]\${PIPESTATUS[@]/#0/\[\033[0m\]\[\033[1;32m\]0\[\033[1;31m\]}\[\033[0m\]]\n${PS1}"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
source ~/.profile

## stuff added by fbandroid/scripts/setup_environment.sh that I moved out from bash_profile
export FBANDROID_DIR=/Users/rege/fbsource/fbandroid
alias quicklog_update=/Users/rege/fbsource/fbandroid/scripts/quicklog/quicklog_update.sh
alias qlu=quicklog_update

# added by setup_fb4a.sh
export ANDROID_SDK=/opt/android_sdk
export ANDROID_NDK_REPOSITORY=/opt/android_ndk
export ANDROID_HOME=${ANDROID_SDK}
export PATH=${PATH}:${ANDROID_SDK}/tools:${ANDROID_SDK}/platform-tools

export EDITOR=vim
export DEV=devvm2029.ash4.facebook.com
export FBID=517282982
