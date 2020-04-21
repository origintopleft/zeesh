if type git &> /dev/null; then
    ticker_message "zeesh: pulling from git" # TODO: less frequently, and background
    start_dir="$(pwd)"

    cd ~/.local/share/zeesh
    git pull &> ~/.local/share/zeesh/pull.log

    cd "${start_dir}"

    _zshrc_updates_pending=0

    if type md5sum &> /dev/null; then
            cmp -s ~/.zshrc ~/.local/share/zeesh/zshrc-stub
            if [[ $? -eq 1 ]]; then
                    cp ~/.local/share/zeesh/zshrc-stub ~/.zshrc
                    _zshrc_updates_pending=1
            fi
    fi
    
    [[ _zshrc_updates_pending -eq 1 ]] && printf "zeesh: stub updates pending\n"
fi
