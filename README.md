# Dotfiles

TODO: add screenshots and description

## Installation

You will need `git` and GNU `stow`.

```sh
sudo apt install git stow
```

Clone into your `$HOME` or `~` directory.

```sh
git clone https://github.com/tnthi115/dotfiles.git
```

Run `stow` to symlink everything or just select what you want:

```sh
stow */ # Everything (the '/' ignores the README.md)
```

```sh
stow zsh # Just my zsh config
```

## TODO

- Add screenshots.
- Create a list of programs installed.
