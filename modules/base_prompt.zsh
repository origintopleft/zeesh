#    PROMPT="%{$fg_bold[cyan]%}%n%{$fg_bold[white]%}@%{$fg_bold[magenta]%}%m %{$fg_bold[white]%}%~ %# %{$reset_color%}"
#    RPROMPT="%(?..%{$fg[red]%}%? )$RPROMPT"

function prompt_userathost () {
    print "%{$fg_bold[cyan]%}%n%{$fg_bold[white]%}@%{$fg_bold[magenta]%}%m %{$fg_bold[white]%}%~"
}

prompt_functions+=prompt_userathost

function rprompt_clock () {
    print "%{$fg_bold[black]%}%T"
}

function rprompt_retval () {
    print "%(?..%{$fg[red]%}%?)"
}

rprompt_functions+=rprompt_clock
rprompt_functions+=rprompt_retval