# Patched Sway(FX)
This patched Sway(FX) binary adds a new command to the IPC: `get_mouse` which allows any app to easily obtain the current X & Y coordinates of the cursor without any extra dependency.

## Installation
To use this patch, you will have to build the binary yourself.

1. Clone the Sway/SwayFX repository.
```sh
$ git clone https://github.com/swaywm/sway.git
```
or
```sh
$ git clone https://github.com/WillPower3309/swayfx.git
```

2. Apply the patch.
```sh
$ git apply PATH/TO/get_mouse_ipc_command.patch
```

3. Compile from source, to do so, refer to their repositories.
- [Compiling on SwayFX](https://github.com/WillPower3309/swayfx#compiling-from-source)
- [Compiling on Sway](https://github.com/swaywm/sway#compiling-from-source)

### For nix users
You can override the sway(fx)-unwrapped package to include the patch.
Refer to [default.nix](https://github.com/Aceroph/nixflakes/blob/main/config/sway/default.nix#L17-L26)

## Usage
```sh
$ swaymsg -t get_mouse
{
  "x": 1227.1724455924525,
  "y": 666.23325681200083
}
```
