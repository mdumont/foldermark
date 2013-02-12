#!usr/bin/env false

[[ -z "$FMARK_ROOT_DIR" ]] && FMARK_ROOT_DIR=~/.folder-mark

function fmark {
    mode=$1
    shift || true
    fmark::$mode $*
}

function fmark::mark {
    MARK="$1"
    MARK_PATH="$FMARK_ROOT_DIR/$MARK"
    MARK_LOC="$(pwd)"

    [[ ! -d $FMARK_ROOT_DIR ]] && mkdir "$FMARK_ROOT_DIR"
    
    echo "$MARK_LOC" > "$MARK_PATH"
}

function fmark::jump {
    MARK="$1"
    MARK_PATH="$FMARK_ROOT_DIR/$MARK"
    MARK_LOC="$(pwd)"

    [[ ! -d $FMARK_ROOT_DIR ]] && {echo "Folder-Mark not setup!"; exit 1}

    MARK_DEST=$(cat "$MARK_PATH")

    cd "$MARK_DEST"

}

function fmark::unmark {
    MARK="$1"
    MARK_PATH="$FMARK_ROOT_DIR/$MARK"
    MARK_LOC="$(pwd)"

    [[ ! -d $FMARK_ROOT_DIR ]] && exit 1

    rm "$MARK_PATH"
}
