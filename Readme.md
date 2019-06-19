[![macos-catalina](https://img.shields.io/badge/macos-catalina-brightgreen.svg)](https://www.apple.com/macos/catalina-preview)
[![macos-mojave](https://img.shields.io/badge/macos-mojave-brightgreen.svg)](https://www.apple.com/lae/macos/mojave)

# Key Mapping

`only_keyboard.se` goes like this:  
![Key Mapping](https://github.com/backslash-f/ShockEmu/blob/master/KeyMapping.png)

# Setup
ShockEmu requires the `OS X Command Line Tools` [to be installed](https://stackoverflow.com/a/53078282/584548).

ShockEmu installation steps:

```zsh
git clone git@github.com:backslash-f/ShockEmu.git
cd ShockEmu
./build.sh only_keyboard.se
./run.sh
```

It depends on your system having PS4 Remote Play installed at `/Applications/RemotePlay.app`. If this is not the case, you'll need to modify `run.sh` accordingly.

# SE File Format
SE files are, generally speaking, a mapping between an input key, mouse button, or mouse movement to a DualShock 4 input. See the example file (`example.se`) for a breakdown of the format.

# How It Works
ShockEmu works by intercepting the IOHID calls of PS4 Remote Play application and presents an emulated DualShock controller. It also hooks into the input routines of the application, to catch keyboard and mouse inputs, which then get mapped according to your SE file.

# Pro Tip
The `alias` below allows for typing `play` / `Enter` anywhere in `Terminal` to have `RemotePlay.app` launched with the above keys mapped:
```
$ cat ~/.zshrc | grep play
alias play="pushd /Users/backslash-f/Downloads/source/backslash-f/ShockEmu; ./run.sh &; popd"
