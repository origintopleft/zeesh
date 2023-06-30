#cols=$(stty -a | grep -Po '(?<=columns )\d+' | tr -d "\n")
cols=$COLUMNS

setopt prompt_subst

function ticker_message () {
    if [[ $_zeeshdev_ticker_newlines == 0 ]]; then
        printf "\r${(l:$cols:: :)A}\r"
        printf "$@"
    else
        printf "$@\n"
    fi
}

function ticker_finish () {
    [[ $_zeeshdev_ticker_newlines == 0 ]] && printf "\r${(l:$cols:: :)A}\r"
}
