# dotfiles

Personal dotfiles managed with [chezmoi](https://chezmoi.io).

## Prerequisites

```sh
brew install chezmoi   # macOS
# or
sh -c "$(curl -fsLS get.chezmoi.io)"
```

## First-time setup on a new machine

```sh
chezmoi init --apply https://github.com/0x1za/dotfiles
```

Replace the URL with your actual repo if different.

## Daily workflow

| Task                          | Command                     |
| ----------------------------- | --------------------------- |
| Apply pending changes         | `chezmoi apply`             |
| See what would change         | `chezmoi diff`              |
| Edit a managed file           | `chezmoi edit ~/.zshrc`     |
| Add a new file                | `chezmoi add ~/.config/foo` |
| Pull & apply upstream changes | `chezmoi update`            |
| Check managed file status     | `chezmoi status`            |

## File naming

chezmoi uses a naming convention in the source directory:

- `dot_` → leading `.` in the destination (e.g. `dot_zshrc` → `~/.zshrc`)
- `private_` → file is created with `0600` permissions
- `executable_` → file is created with `+x`
- `symlink_` → creates a symlink instead of a regular file

## Source directory

```
~/.local/share/chezmoi/   # default source dir
```

Run `chezmoi source-path` to confirm the location on your machine.
