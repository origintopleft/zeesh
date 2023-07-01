typeset -ag prompt_functions
typeset -ag rprompt_functions

function prompt_builder () {
        result=""
        for prompt_func in $prompt_functions; do
                result="${result}$($prompt_func) "
        done
        # prompt will always end with "% " (or "# " if we're somehow root)
        result="${result}%#%{$reset_color%} "
        print "${result}"
}

function rprompt_builder () {
        result=""
        for rprompt_func in $rprompt_functions; do
                result="$($rprompt_func) ${result}"
        done
        result="${result}%{$reset_color%}"
        print "${result}"
}

PROMPT='$(prompt_builder)'
RPROMPT='$(rprompt_builder)'