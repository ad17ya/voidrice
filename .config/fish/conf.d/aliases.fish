# Core behavior
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -vI"
alias df="df -h"
alias free="free -m"
alias mkd="mkdir -pv"

# Tools
alias ffmpeg="ffmpeg -hide_banner"

# Listing / colors
alias ls="ls -hN --color=auto --group-directories-first"
alias ll="ls -lahN --color=auto --group-directories-first"
alias la="ls -a --color=always --group-directories-first"

alias grep="grep --color=auto"
alias egrep="egrep --color=auto"
alias fgrep="fgrep --color=auto"
alias diff="diff --color=auto"
alias ccat="highlight --out-format=ansi"

# Shortcuts
alias ka="killall"
alias trem="transmission-gtk"
alias YT="youtube-viewer"
alias sdn="sudo shutdown -h now"
alias p="sudo pacman"
alias z="zathura"
alias pid="ps -ef | grep"

# Neovim
alias vi="nvim"
alias vim="nvim"
alias v="nvim"
alias e="nvim"
alias vimdiff="nvim -d"

# dev
alias g="git"
alias ga="git add"
alias gs="git status"
alias gcm="git commit -m"
alias gpl="git pull"
alias gps="git push"
alias gamd="git commit --amend --no-edit"

# Misc
alias nf="neofetch"
alias smci="sudo make clean install"

# Dotfiles git
alias config="/usr/bin/git --git-dir=$HOME/.local/share/dotfiles --work-tree=$HOME"

# Yarn fix
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'