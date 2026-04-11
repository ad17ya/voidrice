# ─── ENV VARIABLES ─────────────────────────────────────────────

export EDITOR="nvim"
export BROWSER="brave"
export TERMINAL="alacritty"

# XDG base dirs
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Program configs
export HISTFILE="$XDG_DATA_HOME/history"
export NVM_DIR="$XDG_DATA_HOME/nvm"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"

export LESS=-R
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"

# ─── SOURCE BASHRC ─────────────────────────────────────────────
[[ -f ~/.bashrc ]] && source ~/.bashrc

# ─── AUTO START X (optional, keep if you use startx) ───────────
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx "$XDG_CONFIG_HOME/x11/xinitrc"
fi