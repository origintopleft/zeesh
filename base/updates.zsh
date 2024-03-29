function zeesh_update () {
    if type git &> /dev/null && (( _zeesh_fresh_install != 1 )); then
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
        
        [[ _zshrc_updates_pending -eq 1 ]] && ticker_message "zeesh: stub updates pending"

        echo "lastchk=$(date +%s)" > ~/.local/share/zeesh/update.tbl
    fi
}

if [[ $_zeeshdev_ignore_updates != 1 ]]; then
    ticker_message "zeesh: checking network"
    curl -s https://vcs.otl-hga.net --connect-timeout 1 --max-time 3 > /dev/null
    network_ok=$?

    if [[ $network_ok ]]; then
        if [[ -f ~/.local/share/zeesh/update.tbl ]]; then
            eval $(cat ~/.local/share/zeesh/update.tbl)
        else
            lastchk=0
        fi
        curtime=$(date +%s)
        # if it's been fifteen minutes since the last update, do the update
        [[ ${curtime} -gt $(( lastchk + 900 )) ]] && zeesh_update
    fi
else
    ticker_message "zeesh: skipping updates (fuse blown)"
fi