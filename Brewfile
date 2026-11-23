# Packages the dotfiles depend on. Editing this file reruns `brew bundle` on the next `chezmoi apply`.

tap "jetbrains/utils"

# chezmoi itself, and jq for dot_claude/modify_private_settings.json
brew "chezmoi"
brew "jq"

# Ruby, Node and Python versions; see ~/.config/mise/config.toml
brew "mise"

# Language servers behind Claude Code's LSP tool. The npm ones are in ~/.default-npm-packages and
# ruby-lsp in ~/.default-gems, so mise installs them into every Node and Ruby version.
brew "bash-language-server"
brew "go"
brew "gopls"
brew "jdtls"
brew "jetbrains/utils/kotlin-lsp"
brew "lua-language-server"
brew "rust-analyzer"
cargo "protols"
