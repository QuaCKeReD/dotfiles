# My personal dotfiles

## Setup

Managed via [chezmoi](https://www.chezmoi.io)

### Initial variables

```
export GITHUB_USERNAME=QuaCKeReD
alias cm="$HOME/.local/bin/chezmoi"
```

### macOS setup

> macOS comes with curl

```
xcode-select --install
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init $GITHUB_USERNAME
```

NB;

- This requires `git` and thus the `Xcode Developer Command-Line Tools` is installed first
- Minimum disk space required = >48GB
  - macOS (Ventura) OS requires 13GB
  - macOS (Ventura) System Data starts at ~3.5GB
  - XCode Tools install requires 15.5GB
  - homebrew installs require >16GB
  - iCloud Documents/Desktop/syncing/etc require ?GB

### Linux setup

> Linux comes with wget

```
sh -c "$(wget -qO- get.chezmoi.io)" -- -b $HOME/.local/bin init $GITHUB_USERNAME
```

---

### CLI options

Store the chezmoi binary in a different folder: `-b $HOME/.local/bin`  
Just initialise from github repo: `-- init $GITHUB_USERNAME`  
Initialise and apply from github repo: `-- init --apply $GITHUB_USERNAME`  
Run one-shot install: `--one-shot`

> NB; one-shot installs chezmoi and dotfiles, and then remove all traces of chezmoi, including the source directory and chezmoi's configuration directory

---

## Other commands

Clear `run_once_` script states

```
chezmoi state delete-bucket --bucket=scriptState
```

---

## Resources & Thanks to;

- [Mathias Bynens](https://github.com/mathiasbynens/dotfiles)
- [dotfiles.io](https://dotfiles.io/aliases/)
- [Graham Colgate](https://github.com/gramtech/dotfiles)
- [Awesome dotfiles](https://github.com/webpro/awesome-dotfiles)
