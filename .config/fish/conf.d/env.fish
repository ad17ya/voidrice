# Core apps
set -gx EDITOR nvim
set -gx VISUAL nvim

# XDG (keep, high value)
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_CACHE_HOME $HOME/.cache

# Paths (only what you actually use)
set -gx PATH $HOME/.local/bin $PATH