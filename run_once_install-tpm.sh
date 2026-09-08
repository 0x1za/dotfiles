#!/bin/sh
# Bootstraps the tmux plugin manager on a fresh machine so the plugins named in
# ~/.tmux.conf are installed without pressing prefix + I.
set -e
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone --depth 1 https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi
"$HOME/.tmux/plugins/tpm/bin/install_plugins"
