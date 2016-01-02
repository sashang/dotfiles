#!/bin/bash

ln -sf $(find $HOME/Pictures/wallpapers -type f | shuf | head -n1) $HOME/Pictures/wallpaper 

