export ZSH=/root/.oh-my-zsh

ZSH_THEME="agnoster" # robbyrussell, agnoster, bira, amuse

CASE_SENSITIVE="true"
DISABLE_UPDATE_PROMPT="true"

export UPDATE_ZSH_DAYS=2

plugins=(
  common-aliases
  sudo
  ansible
  kubectl
  aws
  branch
  bundler
  cake
  copybuffer
  copydir
  copyfile
  cp
  docker
  docker-compose
  emoji-clock
  emoji
  encode64
  git
  git-extras
  git-flow-avh
  git-flow
  git-hubflow
  git-prompt
  git-remote-branch
  git-auto-fetch
  gitfast
  github
  gitignore
  history
  history-substring-search
  python
  redis-cli
  vi-mode
  vim-interaction
  zsh_reload
  go
  golang
)

source $ZSH/oh-my-zsh.sh



# User configuration

export LANG=en_US.UTF-8
export LANGUAGE=en_US:en
export LC_CTYPE=en_US.UTF-8
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_PAPER="en_US.UTF-8"
export LC_NAME="en_US.UTF-8"
export LC_ADDRESS="en_US.UTF-8"
export LC_TELEPHONE="en_US.UTF-8"
export LC_MEASUREMENT="en_US.UTF-8"
export LC_IDENTIFICATION="en_US.UTF-8"
export LC_ALL=en_US.UTF-8

# https://github.com/sharkdp/bat/issues/325#issuecomment-425630261
alias bat="/usr/local/bat/bat"

alias zsh_reload="source ~/.zshrc"
alias zshconfig="bat ~/.zshrc"
alias ohmyzsh="open ~/.oh-my-zsh"

alias os="cat /etc/os-release"
alias system="hostnamectl"

alias disk="df -h"

alias kernel="uname -msr"
alias kernel_list='yum --disablerepo="*" --enablerepo="elrepo-kernel" list available'

alias lang="localectl status"
alias lang_en="localectl list-locales | grep en_"
alias lang_zh="localectl list-locales | grep zh_"

alias p_netdata="sudo lsof -n -i :19999 | grep LISTEN"
