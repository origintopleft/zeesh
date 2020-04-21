if type git &> /dev/null; then
    ticker_message "zeesh: pulling from git" # TODO: less frequently, and background
    start_dir="$(pwd)"

    cd ~/.local/share/zeesh
    git pull &> ~/.local/share/zeesh/pull.log

    cd "${start_dir}"
fi
