Minimum supported OS
=====

This version of ShockEmu has been tested on:
* MacOS Mojave (10.14)

Setup
=====

ShockEmu requires the OS X Command Line Tools to be installed.  

Installation steps:

	git clone https://github.com/maephisto666/ShockEmu.git
	./build.sh <filename>.se
	./run.sh

It depends on your system having PS4 Remote Play installed at `/Applications/RemotePlay.app`.  If this is not the case, you'll need to modify `run.sh` accordingly.

SE file format
==============

SE files are, generally speaking, a mapping between an input key, mouse button, or mouse movement to a DualShock 4 input.  See the example file (`example.se`) for a breakdown of the format.

How it works
============

ShockEmu works by intercepting the IOHID calls of PS4 Remote Play application and presents an emulated DualShock controller.  It also hooks into the input routines of the application, to catch keyboard and mouse inputs, which then get mapped according to your SE file.
