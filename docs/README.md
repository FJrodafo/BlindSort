# BlindSort

[![GitHub Pages](https://img.shields.io/badge/%20-FFFFFF?style=social&logo=githubpages&logoColor=black&logoSize=auto)](https://fjrodafo.github.io/BlindSort/)
[![GitHub Stars](https://img.shields.io/github/stars/FJrodafo/BlindSort?style=social&logo=github&logoColor=black&label=Stars&labelColor=FFFFFF&color=FFFFFF)](https://github.com/FJrodafo/BlindSort/stargazers)

## Index

1. [Introduction](#introduction)
2. [Project structure](#project-structure)
3. [Clone the repository](#clone-the-repository)
4. [Installation & Uninstallation](#installation--uninstallation)
    1. [Prerequisites](#prerequisites)
    2. [Install](#install)
        1. [Global installation](#global-installation)
        2. [Local installation](#local-installation)
    3. [Uninstall](#uninstall)
    4. [Shorthand flags](#shorthand-flags)
5. [Testing](#testing)
6. [Run it!](#run-it)
7. [How to play](#how-to-play)
8. [Additional commands](#additional-commands)
9. [Screenshots](#screenshots)
10. [Credits](#credits)

## Introduction

A simple terminal-based number sorting game, written in shell scripting, powered by Bash, designed by [m3tozz](https://github.com/m3tozz)!

This project has been developed on a [Linux](https://github.com/torvalds/linux) system. To learn more about the system, visit the [Dotfiles](https://github.com/FJrodafo/Dotfiles) repository.

## Project structure

```
/
├── assets/
|   ├── example.png
|   ├── loser.png
|   └── winner.png
├── docs/
|   ├── _config.yaml
|   ├── CODE_OF_CONDUCT.md
|   ├── README.md
|   └── SECURITY.md
├── CONTRIBUTING
├── LICENSE
├── blind-sort.sh
├── install.sh
└── uninstall.sh
```

## Clone the repository

Open a terminal in the directory where you store your repositories and clone it with the following command:

```shell
# HTTPS
git clone https://github.com/FJrodafo/BlindSort.git
```

```shell
# SSH
git clone git@github.com:FJrodafo/BlindSort.git
```

## Installation & Uninstallation

### Prerequisites

First of all, make sure you have execute permissions for the scripts:

```shell
chmod +x install.sh uninstall.sh
```

### Install

You can install the game in two ways depending on your needs:

#### Global installation

Installs the game system-wide, making it accessible from anywhere in your terminal:

```shell
./install.sh --global
```

> [!NOTE]
> 
> Installs files into system directories (e.g., `/usr/local/bin`). Requires `sudo` permissions.

#### Local installation

Install the game in the user's environment, making it accessible only from the user's terminal:

```shell
./install.sh --local
```

> [!NOTE]
> 
> Recommended if you don’t have admin permissions or want to avoid system-wide changes.

### Uninstall

Use the corresponding command based on how you installed the game:

```shell
# Global uninstall
./uninstall.sh --global

# Local uninstall
./uninstall.sh --local
```

### Shorthand flags

The commands above also support shorthand flags:

```shell
# Installation
./install.sh -g
./install.sh -l

# Uninstallation
./uninstall.sh -g
./uninstall.sh -l
```

## Testing

If you've made it this far and want to learn a little more about testing your installation, check out the following commands:

This command verifies that the installation has been completed successfully.

```shell
command -v blindsort
```

The second one verifies that you have uninstalled the game correctly, which I hope you haven't done...

```shell
# Globally
test ! -f "/usr/local/bin/blindsort"

# Locally
test ! -f "$HOME/.local/bin/blindsort"
```

> [!TIP]
> 
> You can also verify that the game has been installed correctly by removing the exclamation mark `!` from the two commands above.

## Run it!

Finally, if you have installed the game, either globally or locally, you can now run the following command to start a game!

```shell
blindsort
```

## How to play

- Choose the number of positions (e.g., 6).  
- Random numbers will be given to you.  
- Place each number into an empty position.  
- When all positions are filled, the game checks if the numbers are sorted in ascending order.  
- If sorted, you win; if not, you lose.

## Additional commands

To check the current version of the game, run the following command:

```shell
blindsort --version
```

If you need help, run the following command:

```shell
blindsort --help
```

The commands above also support shorthand flags:

```shell
blindsort -v
blindsort -h
```

## Screenshots

![Example](https://raw.githubusercontent.com/FJrodafo/BlindSort/main/assets/example.png "Example")

![Loser](https://raw.githubusercontent.com/FJrodafo/BlindSort/main/assets/loser.png "Loser")

![Winner](https://raw.githubusercontent.com/FJrodafo/BlindSort/main/assets/winner.png "Winner")

## Credits

Forked from [m3tozz/blindsort-tty](https://github.com/m3tozz/blindsort-tty) without any license, CC0-1.0 license applied by default.

Game originally designed by [m3tozz](https://github.com/m3tozz).
