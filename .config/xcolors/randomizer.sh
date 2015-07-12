#!/bin/bash

## picks a random terminal color scheme and tells X to use it

colors=($(ls *))
len=${#colors[@]}
idx=$(($RANDOM%len))
xrdb -override ${colors[idx]}
urxvt &

