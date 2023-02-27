# Dotfiles

TODO: add screenshots and description

## Installation

You will need `git` and GNU `stow`.

```bash
sudo apt install git stow
```

Clone into your `$HOME` or `~` directory.

```bash
git clone https://github.com/tnthi115/dotfiles.git
```

Run `stow` to symlink everything or just select what you want:

```bash
stow */ # Everything (the '/' ignores the README.md)
```

```bash
stow zsh # Just my zsh config
```

## TODO

- Add screenshots.
- Create a list of programs installed.
