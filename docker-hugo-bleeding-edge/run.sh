#!/bin/bash

HUGO=/usr/local/bin/hugo
URL="localhost"
HUGODIR="/hugo"

echo "Starting hugo"
cd $HUGODIR
$HUGO server -b="$URL" -s "/hugo" --bind "0.0.0.0"
