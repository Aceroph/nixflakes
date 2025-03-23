# My NixOS Configurations
Currently, I have a GNOME configuration and a non-functionning i3 config.

## Installation
1. Clone the project
```sh
$ git clone https://github.com/Aceroph/nixflakes
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
---
If you do wish to try to fix my i3 config, switch to the `i3` branch
```sh
$ git checkout i3
```
and run the following
```sh
$ sudo nixos-rebuild switch --flake .#nixos-i3
```
