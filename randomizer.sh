#!/bin/bash

## picks a random terminal color scheme and tells X to use it

colors=($(find $HOME/.config/xcolors -follow -type f | shuf | head -n 1))
xrdb -merge ${colors}
urxvt &

