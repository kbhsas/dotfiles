# Lines configured by zsh-newuser-install


HISTFILE=~/.zsh-histfile
HISTSIZE=1000
SAVEHIST=1000
set -o vi
unsetopt beep
unsetopt list_beep
unsetopt hist_beep
bindkey -v

#export PATH=$PATH:/usr/local/sbin:$HOME/.rvm/bin:$HOME/bin
#export ZSH=~/.oh-my-zsh
export PATH=$PATH:/usr/local/sbin:$HOME/.local/bin
export LANG=en_US.UTF-8
export EDITOR=vim
#export LD_PRELOAD=libcurl.so.3

zstyle :compinstall filename '/home/kbhsas/.zshrc'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

autoload -Uz compinit && compinit
autoload -Uz colors && colors
setopt PROMPT_SUBST

function git_status() {
  local st="$(git status 2> /dev/null)"
  local ret=""
  local color="green"

  if [[ $st == *Untracked* ]] then
    ret="${ret} @"
    color="magenta"
  fi

  if [[ $st == *"not staged for commit"* ]] then
    ret="${ret} ?"
    color="red"
  fi

  if [[ $st == *"to be committed"* ]] then
    ret="${ret} !"
    color="yellow"
  fi

  if [[ $st == *clean* ]] then
    ret="${ret} \u2713"
    color="green"
  fi

  echo "%{$fg[$color]%}$ret%{$reset_color%}"
}

function git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

#function total_tasks() {
#  num=`todo.sh ls 2>/dev/null | wc -l `
#  let todos=num-2
#  if [ $todos != 0 ]
#  then
#    echo "\u2713 $todos"
#  else
#    echo ""
#  fi
#}
#
#function show_tasks() {
#  todo.sh list 2>/dev/null
#}
#
#ZSH_THEME='minimalparty'
RPROMPT='%~%{$fg[yellow]%}$(git_branch)%{$reset_color%}$(git_status)'
PROMPT="%{$fg[yellow]%}→ %{$reset_color%}"
#alias be="bundle exec"
#alias g=git
#alias hub=git-hub
alias ls='ls --color=auto'
#alias r="bundle exec rails"
#alias rspec="clear; rspec"
#alias t=todo.sh
#alias e="emacs -nw"
alias v=vim
alias youdown="~/Documents/scripts/youdown.sh"
alias showme="zathura MAINDOCUMENT.pdf"
alias compile="pdflatex MAINDOCUMENT.tex"
alias texmux="tmux new -s mango"
alias bibcompile="pdflatex MAINDOCUMENT.tex && bibtex MAINDOCUMENT && pdflatex MAINDOCUMENT.tex"
alias files='nautilus .'
alias compose="setxkbmap -option compose:caps"
alias py="python3"

#show_tasks
#cowsay "All of time and space; everywhere and anywhere; every star that ever was. Where do you want to start?" | lolcat
#PATH="/usr/local/heroku/bin:$PATH"


#test -s "$HOME/.kiex/scripts/kiex" && source "$HOME/.kiex/scripts/kiex"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"
##############  Functions  ##################
encrypt(){
  if [ -z $2 ]; then
    gpg -c --cipher-algo AES256 $1
  else
    gpg -o $2 -c --cipher-algo AES256 $1
  fi
}

#fortune hitchhiker | cowsay | lolcat # must be after the rbenv variables if lolcat is installed as a gem 
#echo "So... all of time and space, everything that ever happened or ever will - where do you want to start?" | cowsay |  lolcat
#echo "There is a theory which states that if ever anyone discovers exactly what the Universe is for and why it is here, it will instantly disappear and be replaced by something even more bizarre and inexplicable. There is another theory which states that this has already happened." | cowsay | lolcat
#TERM=xterm-256color
#TERM=rxvt-unicode-256color
TERM=screen-256color
#TERM=xterm+256colors
