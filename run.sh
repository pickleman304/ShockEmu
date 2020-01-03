#!/bin/bash
trap clean SIGINT

function clean()
{
    rm /tmp/gpad-daemon-data
    killall gpad-daemon
    echo "Program terminated"
}

mkfifo /tmp/gpad-daemon-data
./gpad-daemon&
DYLD_FORCE_FLAT_NAMESPACE=1 DYLD_INSERT_LIBRARIES=iohid_wrap.dylib /Applications/RemotePlay.app/Contents/MacOS/RemotePlay 
clean
