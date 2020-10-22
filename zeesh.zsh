source ~/.local/share/zeesh/base/zeesh.zsh

ticker_message "zeesh: bootstrap"

cols=$(stty -a | grep -Po '(?<=columns )\d+')

if [[ $cols -lt 80 ]]; then
    echo "debug: $cols"
    if [[ $(uname -o) == "Android" ]]; then
        hostemoji="📞"
    else
        hostemoji="🖥"
    fi
    PROMPT="👤%{$fg_bold[white]%}@${hostemoji} %~ %# %{$reset_color%}"
else
    PROMPT="%{$fg_bold[cyan]%}%n%{$fg_bold[white]%}@%{$fg_bold[magenta]%}%m %{$fg_bold[white]%}%~ %# %{$reset_color%}"
fi 
TMOUT=60
TRAPALRM () {
    zle reset-prompt
}

source ~/.local/share/zeesh/base/precmd.zsh
source ~/.local/share/zeesh/base/updates.zsh 

# TODO: handle whether or not to load given modules]
for module in ~/.local/share/zeesh/modules/*.zsh; do
	ticker_message "zeesh: loading module ${module}"
	source ${module}
done

ticker_finish
