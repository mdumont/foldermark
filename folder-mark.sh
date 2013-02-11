#!/bin/bash

ROOT_DIR=~/.folder-mark/
function fmark() {
    MARK=$1
    MARK_PATH="$ROOT_DIR$MARK"
    MARK_LOC=`pwd`

    if [ ! -d $ROOT_DIR ]
      then
        mkdir $ROOT_DIR
    fi

    echo $MARK_LOC > $MARK_PATH
}

function fjump() {
    MARK=$1
    MARK_PATH="$ROOT_DIR$MARK"
    MARK_LOC=`pwd`

    if [ ! -d $ROOT_DIR ]
      then
        echo "Folder-Mark not setup!"
        exit 1
    fi

    MARK_DEST=`cat $MARK_PATH`

    cd $MARK_DEST

}

function funmark() {
    MARK=$1
    MARK_PATH="$ROOT_DIR$MARK"
    MARK_LOC=`pwd`

    if [ ! -d $ROOT_DIR ]
      then
        exit 1
    fi

    rm $MARK_PATH
}
