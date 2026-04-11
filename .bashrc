# ~/.bashrc

# If not interactive → exit
[[ $- != *i* ]] && return

# ─── BASIC SETTINGS ─────────────────────────────────────────────
stty -ixon                     # Disable Ctrl+S / Ctrl+Q
HISTSIZE=
HISTFILESIZE=                 # Infinite history
# set -o vi                     # Vim keybindings

export TERM="xterm-256color"

# ─── PATHS ──────────────────────────────────────────────────────
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/.local/bin/statusbar" ] && PATH="$HOME/.local/bin/statusbar:$PATH"

# ─── PROMPT ─────────────────────────────────────────────────────
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

# ─── TERMINAL TITLE ─────────────────────────────────────────────
case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
    ;;
  screen*)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
    ;;
esac

# ─── SHELL OPTIONS ──────────────────────────────────────────────
shopt -s autocd cdspell cmdhist dotglob histappend checkwinsize
bind "set completion-ignore-case on"

# ─── ARCHIVE EXTRACTION ─────────────────────────────────────────
ex () {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2) tar xjf "$1" ;;
      *.tar.gz)  tar xzf "$1" ;;
      *.bz2)     bunzip2 "$1" ;;
      *.rar)     unrar x "$1" ;;
      *.gz)      gunzip "$1" ;;
      *.tar)     tar xf "$1" ;;
      *.tbz2)    tar xjf "$1" ;;
      *.tgz)     tar xzf "$1" ;;
      *.zip)     unzip "$1" ;;
      *.Z)       uncompress "$1" ;;
      *.7z)      7z x "$1" ;;
      *.deb)     ar x "$1" ;;
      *.tar.xz)  tar xf "$1" ;;
      *.tar.zst) unzstd "$1" ;;
      *) echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# ─── ALIASES ────────────────────────────────────────────────────

# Core behavior
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -vI"
alias df="df -h"
alias free="free -m"
alias mkd="mkdir -pv"

# YouTube
alias yt="youtube-dl --add-metadata -i"
alias yta="yt -x -f bestaudio/best --audio-format mp3"
alias ytv="youtube-dl -i -f best"

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
alias g="git"
alias trem="transmission-gtk"
alias YT="youtube-viewer"
alias sdn="sudo shutdown -h now"
alias p="sudo pacman"
alias z="zathura"
alias vi="nvim"
alias vim="nvim"
alias vimdiff="nvim -d"
alias nf="neofetch"
alias smci="sudo make clean install"

# Dotfiles git
alias config="/usr/bin/git --git-dir=$HOME/.local/share/dotfiles --work-tree=$HOME"

# Yarn fix
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'

# ─── FUNCTIONS ──────────────────────────────────────────────────

# FZF config editor
ce() {
  du -a ~/.config/* ~/.local/bin/ ~/.local/src/ \
  | awk '{print $2}' \
  | fzf \
  | xargs -r $EDITOR
}

# ─── STARTUP ────────────────────────────────────────────────────
pfetch