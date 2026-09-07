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

## Operating guide

Practical guidance for maintaining this setup.

<table>
  <tr>
    <td width="240"><img src="https://media.giphy.com/media/128RvI3CzjuXG8/giphy.gif" width="220" alt="Wu-Tang Financial"></td>
    <td><strong>Diversify your dotfiles.</strong><br>Never keep everything in one file. This repo holds Neovim, Ghostty, tmux, and zsh as separate positions, with a small hedge in <code>dot_bashrc</code> in case zsh ever crashes. Diversify yo' bonds.</td>
  </tr>
  <tr>
    <td width="240"><img src="https://media.giphy.com/media/gizNN8vCaotYA/giphy.gif" width="220" alt="Rick James"></td>
    <td><strong>Handle <code>--force</code> with care.</strong><br><code>chezmoi apply --force</code> will overwrite a hand-edited <code>.zshrc</code> without asking, then introduce itself. Run <code>chezmoi diff</code> first. It is a hell of a flag.</td>
  </tr>
  <tr>
    <td width="240"><img src="https://media.giphy.com/media/uk0OE1jkLXwUkHSGlk/giphy.gif" width="220" alt="Charlie Murphy"></td>
    <td><strong>Read the theme docs before committing.</strong><br><code>theme = CGA</code> in Ghostty is a bold choice. Test it on a throwaway window first, or your next launch is darkness, everybody.</td>
  </tr>
  <tr>
    <td width="240"><img src="https://media.giphy.com/media/d9ltR6odFmQsE/giphy.gif" width="220" alt="Prince holding up a basketball"></td>
    <td><strong>Let the lockfile settle disputes.</strong><br>When two machines disagree on plugin versions, <code>lazy-lock.json</code> decides. LazyVim wins, then serves the losers pancakes. Game, blouses.</td>
  </tr>
  <tr>
    <td width="240"><img src="https://media.giphy.com/media/BMrJzUlkcjdg4/giphy.gif" width="220" alt="Vernon Franklin losing it in a boardroom"></td>
    <td><strong>Do not start fresh with <code>rm -rf ~/.config</code>.</strong><br>Keeping it real by wiping the config directory to "start clean" goes wrong every time. Clone this repo and run <code>chezmoi init --apply</code> instead.</td>
  </tr>
  <tr>
    <td width="240"><img src="https://media.giphy.com/media/bCDzFTSQ3JL8c/giphy.gif" width="220" alt="Silky Johnson at the Player Haters Ball"></td>
    <td><strong>Indentation policy.</strong><br>Two spaces, enforced by <code>stylua.toml</code>. Tab enthusiasts are welcome to open an issue. It will be read, hated, and hated again in the morning.</td>
  </tr>
  <tr>
    <td width="240"><img src="https://media.giphy.com/media/Qf9SNhYtaC4aQ/giphy.gif" width="220" alt="Lil Jon shouting yeah"></td>
    <td><strong>Updating plugins.</strong><br>Run <code>:Lazy update</code>, then open a Rust file and press <code><leader>rr</code>. If it compiles: WHAT? OKAY! YEAAAH!</td>
  </tr>
  <tr>
    <td width="240"><img src="https://media.giphy.com/media/S6PJSHMftMyPK/giphy.gif" width="220" alt="The Wrap It Up box"></td>
    <td><strong>Time-boxing configuration work.</strong><br>Around hour four of adjusting <code>colorscheme.lua</code>, the box lights up. Commit what you have and go outside.</td>
  </tr>
</table>
