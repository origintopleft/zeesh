# Note: location of conda can be unpredictable; user is expected to
#       run `conda init zsh` as normal then move resulting .zshrc
#       modifications to .zshrc.local

# recommended settings for .condarc:
#     auto_assign_base: false
#     changeps1: false

local orig_rprompt="${RPROMPT}"

function precmd_conda_prompt() {
    if [[ -v CONDA_DEFAULT_ENV && "$CONDA_DEFAULT_ENV" != "base" ]]; then
        RPROMPT="%{$fg[cyan]%}$CONDA_DEFAULT_ENV %{$reset_color%} ${orig_rprompt}"
    else
        RPROMPT="${orig_rprompt}"
    fi
}

if (( ${+commands[conda]} )); then
    precmd_functions+=precmd_conda_prompt
fi