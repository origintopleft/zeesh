source ~/.local/share/zeesh/base/zeesh.zsh

ticker_message "zeesh: bootstrap"

PROMPT="%{$fg_bold[cyan]%}%n%{$fg_bold[white]%}@%{$fg_bold[magenta]%}%m %{$fg_bold[white]%}%~ %# %{$reset_color%}"

ticker_finish
