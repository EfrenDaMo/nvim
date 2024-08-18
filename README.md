# Nvim

A repo with my neovim config to keep a consistent coding environment 

I personally use Arch but this should work on other distros and Mac.
It should definitely work on windows as it was origanilly made for my windows work flow.

## Requirements

For windows I would recommend using [Scoop](https://scoop.sh/) as it's packages are more up to date than others like chocolatey.

As for Linux use your distros built-in package manager, on Arch I use pacman most of the time and Yay for files not found in pacman.

### Ripgrep

Not necessary but recommended as theres a lot of uses to it

#### Install

Arch:

```
$ sudo pacman -S ripgrep
```

Windows:

```
> scoop bucket add main
> scoop install main/ripgrep
```

### NPM

Mostly used for mason to install lsp's

#### Install

Arch:

```
$ sudo pacman -S npm
```

Windows:

```
> scoop bucket add main
> scoop install main/nodejs
```

### Tmux

It's not necessary but recommended as one of the extensions is built around it.

> This might be the only extension that doesn't work on windows.

Arch:

```
$ sudo pacman -S tmux
```

## Installation 

Go into the directory where you wish to setup your config and execute the following commands:

(They work on both Windows and Unix based systems)

```
$ git clone https://github.com/EfrenDaMo/nvim.git
$ cd nvim
```

Then run neovim in the command line so that lazy can begin the installation process

```
$ nvim
```

