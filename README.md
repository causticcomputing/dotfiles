```
╔══════════════════════════════════════════╗
║     c a u s t i c  c o m p u t i n g     ║
╚══════════════════════════════════════════╝
```

# dotfiles
Welcome to my dotfiles repo. 
I started out my dotfiles repo in an attempt to learn git and track my personal configuration files.

This is still very much a WIP and I don't plan a release soon.

## Zsh

The Z shell (`zsh`) is a powerful Unix shell and command-line interpreter created in 1990.
Maintaining `bash`'s syntax and behaviour, it deviates in significant ways from POSIX standards of the `sh` language.

It remains my shell of choice for its completion, theming, and more advanced functions & functions.

### Features
- **Git Plugin:** A Git plugin with no OMZ needed. Features branch and dirty/clean indicators.
- **Syntax Highlighting:** Powerful shell syntax highlighting for paths, commands, and aliases.
- **Autosuggestions:** Command suggestions pulled from `.zsh_history`.
- **Tab Completion:** Colored tab completions in the form of a menu.

#### **Prompt**

```
┌[user ◆ hostname]-(~)
└>
```
```
``` 
``` 
```

- `.zshrc`: My personal, main Z shell configuration
- `.aliases.zsh`: Loaded by `.zshrc`, aliases for a better, faster shell workflow.

#### Theme

The zsh prompt uses a modified variant of the `fox` P10K zsh theme. 

## Pacman

My `/etc/pacman.conf` contains functional and visual tweaks:

Tweaks:
- `ILoveCandy`: enables PacMan game ASCII art.
- **Parallel Downloads:** 5 enabled
- **Multilib Repositories:** enables repositories for Steam and other 32-bit programs.

## kitty

Kitty is a fast & modern terminal by brilliant programmer and open source maintainer [Kovid Goyal](https://kovidgoyal.net),
responsible for the `calibre` and `kitty` projects.

Config:
- **Shell:** Z Shell
- **Mod Key**: Ctrl + Shift
- **Theme:** "Symfonic"
- **Font:** Configured for JetBrains Mono Slashed (my favorite nerd font!)
- **Transparency:** 0.80
- **Layout:** Tall

## fastfetch

A custom fastfetch configuration for with an Aphex Twin ASCII art logo.

## packages

The directory `pkgs/` contains lists of package names for the distributions I use, separated by my machines' hostnames. 
Some of these may be useful to new users; dig around and see which packages you could need or want on your installs.

Install the Arch Linux packages with `sudo pacman -S --needed - < packages.txt` to install a specific list of packages.

`arch`: Packages from official Arch Linux repositories.
`aur`: Packages from the Arch Linux User repository. 
`blackarch`: Packages from BlackArch repositories.

## ASCII

A small personal collection ASCII art I find on the net, useful for `fasfetch`, `/etc/motd` or wherever
you might want ASCII art.

## wallpapers

A small collection of high-res wallpapers I use on my machines.
