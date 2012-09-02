source ~/git-completion.bash

alias gc="git commit -m"
alias gl="git lg | head -n 40"
alias ga="git add"
alias gs="git status"
alias gph="git push origin"
alias gpl="git pull origin"
alias gplm="git pull origin master"
alias gco="git checkout"
alias gher='git push heroku master'

alias la='ls -a'
alias lal='ls -al'
alias ll='ls -l'

alias cl='cd ^!; la'
alias fd='find . -name'
alias pip='/Library/Frameworks/Python.framework/Versions/2.7/bin/pip'
alias aws='ssh -i ~/.ssh/GregVaio.pem ubuntu@ec2-50-19-185-231.compute-1.amazonaws.com'
alias vs='vim -S sess'

function branch {
echo $(git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3)
}

export PS1="\u:\W \$(branch)\[\e[0;32m\] $\[\e[0m\] "

alias gpb="git push origin $(branch)"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
