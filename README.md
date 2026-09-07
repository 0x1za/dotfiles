# dotfiles

<p align="center">
  <img src="https://media.giphy.com/media/QMHoU66sBXqqLqYvGO/giphy.gif" width="400" alt="This is fine dog sitting in a burning room">
  <br>
  <em>My terminal, five minutes after "just a quick tweak" to the config.</em>
</p>

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

## Jokes

Because a dotfiles repo without at least one bad joke is just a backup.

- How do you generate a random string? Put a new developer in front of Vim and tell them to exit.
- My dotfiles are like my gym membership: heavily configured, rarely applied.
- I spent six hours tuning my Neovim config today. Productivity gains: pending. Estimated ROI: 2043.
- `chezmoi apply` is the only relationship I have where "it worked on my machine" is a valid excuse.
- Why did the developer put their config in git? So they could blame someone else for `dot_zshrc`.
- Q: What is the difference between a terminal emulator and a therapist? A: The therapist does not have a `theme` option.
- Ghostty, tmux, Neovim. Three programs, one goal: making sure I never leave a single window.

### Chappelle's Show edition

- **Wu-Tang Financial:** "You need to diversify yo' dotfiles." I put half in Neovim, half in Ghostty, and a small hedge in `dot_bashrc` in case zsh ever crashes.
- **Rick James:** `chezmoi apply --force` overwrote my hand-edited `.zshrc` and all it said was "I'm chezmoi, b\*\*\*\*." Cocaine is a hell of a drug. So is `--force`.
- **Charlie Murphy:** "Darkness, everybody." That was the terminal after I set `theme = CGA` without reading the docs.
- **Prince:** Challenged my old config to a game of who boots faster. LazyVim won. Then it served the losers `lazy-lock.json`. Game, blouses.
- **When Keeping It Real Goes Wrong:** Deus decided to keep it real and run `rm -rf ~/.config` to "start fresh." Deus now has a chezmoi repo.
- **Player Haters Ball:** "I hate your tab width. I'm gonna hate it in the morning." Two spaces. Silky Johnson approves.
- **Lil Jon:** Me, every time a plugin update breaks nothing: WHAT? OKAY! YEAAAH!
- **The Wrap It Up box:** What GitHub should show me around hour four of tweaking `colorscheme.lua`.

