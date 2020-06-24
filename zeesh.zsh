source ~/.local/share/zeesh/base/zeesh.zsh

ticker_message "zeesh: bootstrap"

PROMPT="%{$fg_bold[cyan]%}%n%{$fg_bold[white]%}@%{$fg_bold[magenta]%}%m %{$fg_bold[white]%}%~ %# %{$reset_color%}"

source ~/.local/share/zeesh/base/precmd.zsh
source ~/.local/share/zeesh/base/updates.zsh 

# TODO: handle whether or not to load given modules]
for module in ~/.local/share/zeesh/modules/*.zsh; do
	ticker_message "zeesh: loading module ${module}"
	source ${module}
done

ticker_finish
