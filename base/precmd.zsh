typeset -ag precmd_functions

function precmd_tab_directory () {
        print -Pn "\e]0;%n@%m: %~\a"
}

precmd_functions+="precmd_tab_directory"