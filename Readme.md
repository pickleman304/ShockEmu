# Key Mapping

`only_keyboard.se` goes like this:
![Key Mapping](https://github.com/backslash-f/ShockEmu/blob/master/KeyMapping.png)

This is of course customizable.

Tested on:
* macOS Catalina 10.15

# Setup
ShockEmu requires the OS X Command Line Tools to be installed.

Installation steps:

```zsh
git clone git@github.com:backslash-f/ShockEmu.git
./build.sh only_keyboard.se
./run.sh
```

It depends on your system having PS4 Remote Play installed at `/Applications/RemotePlay.app`. If this is not the case, you'll need to modify `run.sh` accordingly.

# SE File Format
SE files are, generally speaking, a mapping between an input key, mouse button, or mouse movement to a DualShock 4 input. See the example file (`example.se`) for a breakdown of the format.

# How It Works
ShockEmu works by intercepting the IOHID calls of PS4 Remote Play application and presents an emulated DualShock controller. It also hooks into the input routines of the application, to catch keyboard and mouse inputs, which then get mapped according to your SE file.
