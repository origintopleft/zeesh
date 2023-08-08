(( $+commands[git] )) || return

if (( $+commands[git-lfs] )); then
    # ensures git-lfs is functional if installed
    git config --get filter.lfs.process &> /dev/null || git lfs install
fi

function git_prompt() {
    git rev-parse --is-inside-work-tree &> /dev/null
    __git_prompt__is_git_dir=$?

    if [[ $__git_prompt__is_git_dir -eq 0 ]]; then
        commithash=$(git log --pretty=format:"%h" -n 1)
        fullbranchname=$(git name-rev --name-only ${commithash})
        branchtype=$(echo ${fullbranchname} | cut -d"/" -f1)

        if [[ "${branchtype}" == "refs" ]]; then
            branchname=$(echo ${fullbranchname} | cut -d"/" -f3)
        elif [[ "${branchtype}" == "remotes" ]]; then
            branchname=$(echo ${fullbranchname} | cut -d"/" -f2-)
        elif [[ "${branchtype}" == "tags" ]]; then
            branchname=$(echo ${fullbranchname} | cut -d"/" -f2)
        elif [[ "${branchtype}" == "${fullbranchname}" ]]; then
            # git did it for us
            branchname=${fullbranchname}
        else
            branchname=${fullbranchname}
            # output a warning to stderr, convenience for maintenance
            echo "warning: unrecognized branch type ${branchtype}" >&2
        fi

        print "%{$fg_bold[yellow]%}${branchname} %{$fg[yellow]%}${commithash}"
    fi
}

rprompt_functions+=git_prompt