# Note: location of conda can be unpredictable; user is expected to
#       run `conda init zsh` as normal then move resulting .zshrc
#       modifications to .zshrc.preload

# recommended settings for .condarc:
#     auto_assign_base: false
#     changeps1: false

function conda_prompt() {
    if [[ -v CONDA_DEFAULT_ENV && "$CONDA_DEFAULT_ENV" != "base" ]]; then
        print "%{$fg[cyan]%}$CONDA_DEFAULT_ENV"
    fi
}

if (( ${+commands[conda]} )); then
    rprompt_functions+=conda_prompt
fi