#!/bin/bash

ROOT_DIR=~/.folder-mark/
MARK=$1
MARK_PATH="$ROOT_DIR$MARK"
MARK_LOC=`pwd`

if [ ! -d $ROOT_DIR ]
  then
    mkdir $ROOT_DIR
fi

echo $MARK_LOC > $MARK_PATH
