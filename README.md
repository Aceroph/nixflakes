# My NixOS Configuration
Currently running SwayFX with waybar as of June 21st, 2025

## Installation
1. Clone the project
```sh
$ git clone https://github.com/Aceroph/nixflakes.git
```
2. Step into the cloned directory
```sh
$ cd nixflakes/
```
3. Make you have installed NixOS, obviously..
4. Build the configuration
```sh
$ sudo nixos-rebuild switch --flake .
```

## TODO
- [ ] Set up a notification daemon (dunst)
- [ ] Make my own app launcher and ditch dmenu
- [ ] Make my own status bar and ditch waybar
- [ ] Make my own GTK theme
- [ ] Customize discord (vesktop), steam, firefox & spotify
- [x] Setup zsh & zoxide
