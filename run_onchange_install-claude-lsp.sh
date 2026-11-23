#!/bin/sh
# Installs the language servers and plugins behind Claude Code's LSP tool.
# jdtls and lua-language-server come from Mason via the wrappers in ~/.local/bin.
set -e
[ -s "$HOME/.nvm/nvm.sh" ] && . "$HOME/.nvm/nvm.sh"
# typescript-language-server drives tsserver.js, which TypeScript 7 (the Go port) no longer ships.
npm install -g typescript-language-server typescript@6
command -v claude >/dev/null || exit 0
claude plugin marketplace add "$HOME/.claude/local-plugins" >/dev/null 2>&1 || true
for p in typescript-lsp pyright-lsp rust-analyzer-lsp ruby-lsp gopls-lsp lua-lsp jdtls-lsp; do
  claude plugin install "$p@claude-plugins-official" || true
done
claude plugin install dart-lsp@local || true
