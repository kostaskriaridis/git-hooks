# [Sublime Text]
find_project()
{
    local PROJECT_ROOT="${PWD}"
    local FINAL_DEST="."

    while [[ $PROJECT_ROOT != "/" && ! -d "$PROJECT_ROOT/.git" ]]; do
        PROJECT_ROOT=$(dirname $PROJECT_ROOT)
    done

    if [[ $PROJECT_ROOT != "/" ]]; then
        local PROJECT_NAME="${PROJECT_ROOT##*/}"

        local SUBL_DIR=$PROJECT_ROOT
        while [[ $SUBL_DIR != "/" && ! -f "$SUBL_DIR/$PROJECT_NAME.sublime-project" ]]; do
            SUBL_DIR=$(dirname $SUBL_DIR)
        done

        if [[ $SUBL_DIR != "/" ]]; then
            FINAL_DEST="$SUBL_DIR/$PROJECT_NAME.sublime-project"
        else
            FINAL_DEST=$PROJECT_ROOT
        fi
    fi

    st $FINAL_DEST
}

alias st=subl
alias stt='st .'
alias sta='st . -add'
alias stp=find_project
