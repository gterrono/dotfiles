# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

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
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
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

# some more ls aliases
alias ls='ls -CFG'
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
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#From my mac's .bashrc
source ~/git-completion.bash

alias gc="git commit -m"
alias gl="git lg | head -n 40; echo"
alias ga="git add -A"
alias gap="git add . -p"
alias gs="git status -s"
alias gst="git status"
alias gd="git diff"
alias gph="git push"
alias gphm="git push origin master"
alias gpl="git pull"
alias gplm="git pull origin master"
alias gplu="git pull upstream master"
alias grb="git pull --rebase"
alias gco="git checkout"
alias gsq="git rebase -i HEAD~2"
alias gher='git push heroku master'

alias chrome='/Applications/"Google Chrome"'
alias cl='cd ^!; la'
alias fd='find . -name'
alias aws='ssh -i ~/.ssh/GregVaio.pem ubuntu@ec2-50-19-185-231.compute-1.amazonaws.com'
alias vs='vim -S sess'
alias code='cd ~/Code'
alias reload='unalias -a; source ~/.bash_profile'
alias ocaml='rlwrap ocaml'
alias ip='ipython'
alias actionio='ssh action@use1.actionbox.io -p 11778'
alias v="vim"

alias gum="cd ~/Code/gumroad/web"
alias vs="vagrant ssh"
alias vu="vagrant up"

alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

alias bashrc='vim ~/.bashrc'
alias simple_server='python -m SimpleHTTPServer'

function gitvim {
  vim `git status | grep modified | awk '{print $3}'`
}

function vol {
  osascript -e "set volume $1"
}

function copy {
  if [ -f $1 ];
  then
    cp $1 ~/copy-things/
    cd ~/copy-things/
    git add $1
    git commit -m $1
    git push origin master
    cd -
  else
    echo "File $1 does not exist."
  fi
}

function db {
  if [ -f $1 ];
  then
    cp $1 ~/Dropbox/command-line
  else
    echo "File $1 does not exist."
  fi
}

function convert_vid {
  ffmpeg -i $1S$2E$3.mkv $1S$2E$3.mp4
}

function convert_vids {
  for i in {1..24}
  do
    convert_vid $1 $2 $i
  done
}

function convert_seasons {
  for i in {6..8}
  do
    convert_vids $1 $i
  done
}

function branch {
  echo $(git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3)
}

export PS1="\u:\W \$(branch)\[\e[0;32m\] $\[\e[0m\] "

function gpb {
  git push origin $(branch)
}

function gplb {
  git pull origin $(branch)
}

function gfpb {
  git push --force origin $(branch)
}

# From https://stackoverflow.com/questions/50940895/how-to-extract-mp4-video-from-m3u8-file
function download-playlist() {
    if [[ -n "$1" ]]; then
        touch ./files.txt;
        counter=1;
        while read line; do
            if [[ "$line" == "http"* ]]; then
                curl --silent -o ${counter}.mp4 "$line";
                echo "file ${counter}.mp4" >> ./files.txt;
                ((counter++));
            fi;
        done < "$1";
        ffmpeg -f concat -safe 0 -i ./files.txt -codec copy output.mp4;
    else
        echo 'Usage: download-playlist <file.m3u8>';
    fi
}

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#Adding node and npm packages to path
export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:/usr/local/share/npm/bin:$PATH"

#Adding pip packages to path
export PATH="/usr/local/share/python:$PATH"

#Adding adb and fastboot
#export PATH="~/Downloads/adt-bundle-mac-x86_64-20130514/sdk/platform-tools:$PATH"

export PATH=${PATH}:~/bin

export PATH="$PATH:/Applications/Android Studio.app/sdk/platform-tools"

export PATH="$PATH:$HOME/.local/bin"

export PATH="$PATH:/Library/Frameworks/R.framework/"

alias r="/Library/Frameworks/R.framework/Resources/R"
alias rsc="/Library/Frameworks/R.framework/Resources/Rscript"
alias cd_ext_drive="cd /Volumes/Greg\'s\ External\ HD\ -\ Data/"
