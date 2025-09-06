# Setting Up Your Dev Environment in Linux

## How to make stuff look pretty and less boring :)

*MsC. João Rossi*

---

## Agenda
- linux recap
- shells vs terminal emulators
- terminal setup
- editors & IDEs
- languages & version managers
- git setup
- dotfiles & productivity
- extras (containers, automation)
- exercises & resources


---

## Filesystem Hierarchy
- `/home` → your personal files and configs
- `/etc` → system-wide configuration
- `/usr/bin` → executables and binaries
- `/var` → logs, caches, spool data


---

## Filesystem Visualization
```
/
├── etc/
├── home/
│   └── user/
├── usr/
│   └── bin/
└── var/
```

---
## Files
- what really is a file?
    - regular files (text, binaries)
    - directories (special files mapping names to inodes)
    - kernel interfaces → `/proc`, `/sys` (virtual filesystems, not on disk)
    - ...

- what linux exposes as a file?
    - memory pages and buffers (kernel data structures)
    - page cache, inodes, task structs
    - ...

---

## The Trick
- linux exposes kernel state **as if** it were files
- `/proc/cpuinfo` → generated on the fly
- `/sys` → configure devices
- "everything is a file" = **unified interface**
- not all kernel internals are files
- but linux tries to expose most resources *like* files

---

## Permissions Refresher
- access is controlled with three bits: **rwx**
- three groups: **user, group, others**

example:
```
-rwxr-xr--  1 user staff  script.sh
```

---

## Changing Permissions
- `chmod` → change read/write/execute bits
- `chown` → change owner
- `ls -l` → check current permissions

```
chmod +x script.sh
chown user:group script.sh
```

---

## Package Managers
linux distros use different managers:

- **debian/ubuntu** → `apt`
- **fedora** → `dnf`
- **arch** → `pacman`

---

## Package Manager Commands
examples:

```
# update
sudo apt update && sudo apt upgrade

# install
sudo dnf install git

# remove
sudo pacman -R neovim
```

---

## Shell Basics
- check your PATH:
```
echo $PATH
```

- create aliases:
```
alias ll="ls -la"
```

- set environment variables:
```
export EDITOR=nvim
```

---

# Terminal

Ok, but where do we run our commands?

What really is a terminal?


---

## Terminal Emulator
- a program that runs inside your graphical environment and **emulates** a text console
- responsible for appearance and features:
    - font, colors, GPU rendering, etc...
- the **window** into your shell
- examples: kitty, alacritty, konsole, etc


---

## Shell
- a program that **interprets** your commands
- responsible for:
    - autocomplete
    - syntax highlighting
    - scripting
    - automation
    - prompt customization
- the **language** of your terminal
- examples: bash, zsh, fish, etc

---

## Diagram
```
~~~graph-easy --as=boxart
[ terminal emulator ] - to -> [ shell ] - to -> [ programs ]
~~~
```

---

# Terminal Customization

The terminal is ugly and boring, how to make it cooler?

---

## Prompt Customization

- starship: [https://starship.rs/](https://starship.rs/)
- oh my zsh: [https://ohmyz.sh/](https://ohmyz.sh/)
- fish: [https://fishshell.com/](https://fishshell.com/)

---

## Terminal Customization (Kitty)
- a modern terminal emulator
- supports:
  - fast and smooth GPU rendering :)
  - ligatures and emojis
  - splits and tabs
- config file: `~/.config/kitty/kitty.conf`

---

## Fonts and icons
- nerd fonts: [https://nerdfonts.com](https://nerdfonts.com) 
- examples: JetBrainsMono, FiraCode, IBM VGA

---

## Useful CLI Tools
- **fzf**: fuzzy finder
  - search files, history, git commits
- **ripgrep (rg)**: faster grep
- **bat**: cat clone with syntax highlighting
- **htop**: interactive process viewer
- **tree**: directory tree
- **tmux**: terminal multiplexer

---

## Hands-on: Font
- download and install a nerd font:
    - download the file on nerdfonts website
    - unzip to `~/.local/share/fonts/`
    - run `fc-cache -fv`


---

## Hands-on: Terminal
- create a directory with the name `dotfiles`
- install **Kitty**:
    - sudo apt install -y kitty
- launch it: `kitty &`
- create or edit the config file `~/.config/kitty/kitty.conf`
- access [https://github.com/joaorossi15/dots/tree/b-r](https://github.com/joaorossi15/dots/tree/b-r) to see an example

---

## Hands-on: Shell (Fish)

- `sudo apt install -y fish`
- set as default shell: `chsh -s $(which fish)`
- everything is a function
- create a function with `function name`
- or edit `~/.config/fish/functions/FUNCTION-NAME.fish`
- to define PATH, aliases, etc: `~/.config/fish/config.fish`


---

## Hands-on: Shell (Bash)
- already installed, POSIX compliant
- edit the ~/.bashrc file
- less user-friendly
- example: 
    - add `PS1='\[\e[1;32m\]\u@\h \[\e[1;34m\]\w \[\e[0m\]\$ '` to ~/.bashrc
    - run `source ~/.bashrc`
