# My dotfiles (and more...)

A bunch of dotfiles and some other stuff I use. That it.

## Install

### Dotfiles

Just clone this repository (or a fork) in your home directory, and use [GNU Stow](https://www.gnu.org/software/stow/) in order to use a specific configuration:

`stow <file or folder>`

### and some other stuff...

I also keep some other usefull system config and scripts here:
- [aur](./aur): some [Arch User Repositories](https://wiki.archlinux.org/index.php/Arch_User_Repository) repositories I use (and forked if needed)
- [etc](./etc): system config to link in /etc

> _**FYI**: I mainly use Arch Linux, and sometimes Debian. Obviously, some parts of this project would need some tweaking if you don't use Arch Linux yourself._

For more details see [install.sh](./install.sh). _Don't use this script directly! I only use it when if need to take down any notes about some commands I use, not for automatic install._

## Sub-projects

- [Spaceship Angular Prompt](./zsh/.zshrc.d/spaceship-angular-prompt)

## Tools

### Hyper.js

A terminal built on web technologies

| :octocat: repo | :globe_with_meridians: website | :arrow_down: install |
|----------------|---------------------------------|------------------------|
| [zeit/hyper](https://github.com/zeit/hyper)| [hyper.is](https://hyper.is/) | forked [AUR](./aur) |

### VS Code

Code editing.\
**Redefined.**

| :octocat: repo | :globe_with_meridians: website | :arrow_down: install |
|----------------|---------------------------------|------------------------|
| [Microsoft/vscode](https://github.com/Microsoft/vscode)| [code.visualstudio.com](https://code.visualstudio.com) | `pacman -S code` |

## Oh My ZSH

Open source, community-driven framework for managing your zsh configuration.

:electric_plug: Submodule in [/zsh](./zsh/)

## Spaceship ZSH

:rocket: :star: A Zsh prompt for Astronauts

:electric_plug: Submodule in [/zsh/.zsh-custom/themes/](./zsh/.zsh-custom/themes/)

## Awesome

Highly configurable, next generation framework window manager for X.

| :octocat: repo | :globe_with_meridians: website | :arrow_down: install |
|----------------|---------------------------------|------------------------|
| [awesomeWM/awesome](https://github.com/awesomeWM/awesome)| awesomewm.org | `pacman -S awesome` |

### Widgets

- [deficient/battery-widget](https://github.com/deficient/battery-widget)


## CLI

### Hub

A command-line tool that makes git easier to use with GitHub.

| :octocat: repo | :globe_with_meridians: website | :arrow_down: install |
|----------------|---------------------------------|------------------------|
| [github/hub](https://github.com/github/hub)| [hub.github.com](https://hub.github.com/) | `$ sudo pacman -S hub` |

### Physlock

Lightweight linux console locking tool

:octocat: [muennich/physlock](https://github.com/muennich/physlock)


## Misc

See this repository [submodules](./.gitmodules).
