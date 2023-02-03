# My personal dotfiles

## Setup

Managed via [chezmoi](https://www.chezmoi.io)

### Setup variables

```
export GITHUB_USERNAME=QuaCKeReD
alias cm="$HOME/.local/bin/chezmoi"
```

### macOS setup

macOS comes with curl

```
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin init $GITHUB_USERNAME
```

### Linux setup

As Linux comes with wget

```
sh -c "$(wget -qO- get.chezmoi.io)" -- -b $HOME/.local/bin init $GITHUB_USERNAME
```

### Other cli options

`-- init $GITHUB_USERNAME`
`-- init --apply $GITHUB_USERNAME`
`-b $HOME/.local/bin`

## Resources & Thanks to;

- [Mathias Bynens](https://github.com/mathiasbynens/dotfiles)
- [dotfiles.io](https://dotfiles.io/aliases/)
- [Graham Colgate](https://github.com/gramtech/dotfiles)
- [Awesome dotfiles](https://github.com/webpro/awesome-dotfiles)
