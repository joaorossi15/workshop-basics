# Extra Topics for Dev Environment Presentation

## Programming Languages and Version Managers

Programming Languages
================
- linux comes with system-wide interpreters
- problem: projects often need **different versions**
- solution: version managers keep things isolated
- benefit: no conflicts, reproducible setups

Python
================
- system python may be outdated
- use **pyenv**:
  - install multiple python versions
  - switch per-project or globally
- integrates with `pip` + virtualenv

Node.js
================
- fast-moving ecosystem
- use **nvm** (node version manager):
  - install node + npm easily
  - `nvm install 18` / `nvm use 20`
- alternative: **volta** (faster)

Ruby & Others
================
- **rbenv**: manage ruby versions
- **goenv**: manage go versions
- **asdf**: one manager, many languages (plugins)
- use `.tool-versions` file for reproducibility

Hands-on: pyenv
================
```
# install pyenv
curl https://pyenv.run | bash

# list available versions
pyenv install --list

# install one
pyenv install 3.11.8

# set global or local version
pyenv global 3.11.8
pyenv local 3.10.2
```

---

Dotfiles
================
<!-- incremental_lists: true -->
- configuration files usually start with `.`
- examples:
  - `~/.bashrc`
  - `~/.config/nvim/init.lua`
  - `~/.config/kitty/kitty.conf`
- dotfiles define your **personalized linux**

Dotfile Management
================
<!-- incremental_lists: true -->
- store configs in git → **portable setup**
- clone on new machine = instant environment
- famous repos on github: “awesome-dotfiles”

Hands-on: Dotfiles
================
- create a git repo:
```
mkdir ~/dotfiles && cd ~/dotfiles
git init
```
- move configs into repo
- symlink them back:
```
ln -s ~/dotfiles/kitty.conf ~/.config/kitty/kitty.conf
```
- push to github → reuse anywhere


Making Linux Pretty
================
<!-- incremental_lists: true -->
- your desktop is also your workspace
- customizing helps with:
  - productivity
  - aesthetics
  - comfort
- linux is infinitely customizable :)

Themes and Appearance
================
<!-- incremental_lists: true -->
- **GTK themes** → change how apps look
- **icon packs** → replace system icons
- **cursor themes** → small detail, big impact
- install via package manager or sites like gnome-look.org


Polybar
================
<!-- incremental_lists: true -->
- highly customizable status bar
- used with window managers (i3, bspwm, awesomewm)
- displays:
  - workspaces
  - system info (cpu, ram, net)
  - custom scripts
- config file: `~/.config/polybar/config.ini`
- tip: https://github.com/adi1090x/polybar-themes

Rofi
================
<!-- incremental_lists: true -->
- application launcher and more
- lightweight, fast, minimal
- can replace dmenu
- usage:
  - run apps
  - switch windows
  - even menus for scripts
- tip: https://github.com/adi1090x/rofi

Conky
================
<!-- incremental_lists: true -->
- desktop system monitor
- shows:
  - cpu, ram, disks
  - network stats
  - weather, calendar
- text-based config in `~/.conkyrc`
- can blend into your wallpaper

Wallpaper and Compositor
================
<!-- incremental_lists: true -->
- wallpapers set the tone
- compositors:
  - **picom** → transparency, blur, shadows
- subtle effects improve focus
- tip: keep dark/light variants for different moods


Autostart Applications
================
<!-- incremental_lists: true -->
- many desktop environments use `~/.config/autostart/`
- place `.desktop` files here to run apps on login
- useful for:
  - system monitors (conky, polybar)
  - background services (clipman, redshift)
  - custom scripts
- example `.desktop` file:

```ini
[Desktop Entry]
Type=Application
Name=Polybar
Comment=Start Polybar on login
Exec=/usr/bin/env bash -c 'killall -q polybar; sleep 1; ./polybar-themes/simple/colorblocks/launch.sh'
X-GNOME-Autostart-enabled=true
```

Hands-on: Prettify
================
1. install polybar and rofi
2. create configs in `~/.config/`
3. experiment with themes (GTK, icons, cursors)
4. set a good wallpaper
5. tweak with picom for final polish

Before and After
================
<!-- incremental_lists: true -->
- default linux → functional but bland
- customized linux → unique, powerful, aesthetic
- small tweaks = big difference in user experience

Showcase Ideas
================
<!-- incremental_lists: true -->
- minimal rice (clean, monochrome, few distractions)
- colorful rice (bright themes, icons everywhere)
- retro rice (IBM VGA font, pixel wallpapers)
- modern rice (blur, transparency, flat icons)


# Containers with Docker

Why Containers?
================
<!-- incremental_lists: true -->
- lightweight, isolated environments
- ship apps with all dependencies included
- run anywhere without "works on my machine" issues

Docker Basics
================
<!-- incremental_lists: true -->
- build images from a **Dockerfile**
- run containers from those images
- containers share host kernel but are isolated
```
docker build -t myapp .
docker run -it myapp
```

Docker Compose
================
<!-- incremental_lists: true -->
- manage multiple containers with one file
- useful for dev environments (web + db + cache)
```yaml
version: "3"
services:
  web:
    build: .
    ports:
      - "5000:5000"
  db:
    image: postgres:15
```

Hands-on: Docker
================
<!-- incremental_lists: true -->
1. install docker with your package manager
2. pull an image:
```
docker pull alpine
```
3. run a shell inside it:
```
docker run -it alpine sh
```
4. remove containers/images:
```
docker ps -a
docker rm <id>
docker rmi <image>
```
