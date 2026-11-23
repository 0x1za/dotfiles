#!/bin/sh
# Installs the language servers and plugins behind Claude Code's LSP tool.
# jdtls, lua-language-server and protols come from Mason via the wrappers in ~/.local/bin.
set -e
export PATH="/opt/homebrew/bin:$PATH"
[ -s "$HOME/.nvm/nvm.sh" ] && . "$HOME/.nvm/nvm.sh"

# typescript-language-server drives tsserver.js, which TypeScript 7 (the Go port) no longer ships.
npm install -g typescript-language-server typescript@6 svelte-language-server bash-language-server
brew install go JetBrains/utils/kotlin-lsp
go install golang.org/x/tools/gopls@latest
rustup component add rust-analyzer || echo "rust-analyzer: fix ~/.rustup ownership (sudo chown -R $(id -un) ~/.rustup) and rerun" >&2

starpls=v0.1.22
if [ "$("$HOME/.local/bin/starpls" version 2>/dev/null)" != "starpls version: $starpls" ]; then
  mkdir -p "$HOME/.local/bin"
  curl -fsSL "https://github.com/withered-magic/starpls/releases/download/$starpls/starpls-darwin-arm64" -o "$HOME/.local/bin/starpls"
  chmod +x "$HOME/.local/bin/starpls"
fi

command -v claude >/dev/null || exit 0
claude plugin marketplace add "$HOME/.claude/local-plugins" >/dev/null 2>&1 || true
claude plugin marketplace update local >/dev/null 2>&1 || true
for p in clangd-lsp gopls-lsp jdtls-lsp kotlin-lsp lua-lsp pyright-lsp ruby-lsp rust-analyzer-lsp swift-lsp typescript-lsp; do
  claude plugin install "$p@claude-plugins-official" || true
done
for p in bash-lsp dart-lsp proto-lsp starlark-lsp svelte-lsp; do
  claude plugin install "$p@local" || true
done
