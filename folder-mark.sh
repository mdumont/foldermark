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

    [[ ! -d $FMARK_ROOT_DIR ]] && { echo "Folder-Mark not setup!"; return; }

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

function fmark::list {
    MARKS="$FMARK_ROOT_DIR/*"
    for f in $MARKS
        do
            echo "$(basename $f) -> $(cat $f)"
        done
}

function fmark-internal::validate-git {
    HAS_GIT=$(which git)
    [[ -z $HAS_GIT ]] && { echo "Command requires git."; return 1; }

    [[ ! -d "$FMARK_ROOT_DIR/.git" ]] && { pushd $FMARK_ROOT_DIR > /dev/null; git init > /dev/null; git add . > /dev/null; git commit -m 'initial marks' > /dev/null; popd > /dev/null; }

    return 0;
}

function fmark::create-set {
    SET_NAME=$1
    fmark-internal::validate-git
    [[ $? -eq 1 ]] && { echo "Git setup error"; return; }

    pushd $FMARK_ROOT_DIR > /dev/null
    BRANCH_EXISTS=$(git branch | grep "$SET_NAME")
    if [[ -z $BRANCH_EXISTS ]]
        then
            git checkout -b $SET_NAME > /dev/null
        else
            echo "Set already exists!"
    fi
    popd > /dev/null

}

function fmark::delete-set {
    SET_NAME=$1
    fmark-internal::validate-git
    [[ $? -eq 1 ]] && { echo "Git setup error"; return; }
    #unimplemented
}

function fmark::change-set {
    SET_NAME=$1
    fmark-internal::validate-git
    [[ $? -eq 1 ]] && { echo "Git setup error"; return; }

    pushd $FMARK_ROOT_DIR > /dev/null
    BRANCH_EXISTS=$(git branch | grep "$SET_NAME")
    if [[ -z $BRANCH_EXISTS ]]
        then
            echo "Set does not exist!"
        else
            git checkout $1 > /dev/null
    fi

    popd > /dev/null
}
