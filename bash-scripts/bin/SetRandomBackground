#!/bin/bash

RANDOMFILE=`ls -p $1 | grep -v '/$' | sort -R | tail -1`
echo "Setting background: $1/$RANDOMFILE"
feh --bg-fill "$1/$RANDOMFILE"
