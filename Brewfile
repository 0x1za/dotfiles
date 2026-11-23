# Packages the dotfiles depend on. Editing this file reruns `brew bundle` on the next `chezmoi apply`.

tap "jetbrains/utils"

# chezmoi itself, and jq for dot_claude/modify_private_settings.json
brew "chezmoi"
brew "jq"

# Language servers behind Claude Code's LSP tool
brew "bash-language-server"
brew "go"
brew "gopls"
brew "jdtls"
brew "jetbrains/utils/kotlin-lsp"
brew "lua-language-server"
brew "rust-analyzer"
cargo "protols"
npm "svelte-language-server"
npm "typescript-language-server"
# typescript-language-server drives tsserver.js, which TypeScript 7 (the Go port) no longer ships;
# that is also why this comes from npm and not Homebrew, whose formula depends on TypeScript 7.
npm "typescript@6"
