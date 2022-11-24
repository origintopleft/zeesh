# The following lines were added by compinstall

zstyle ':completion:*' auto-description '%BCompleting argument: $F{magenta}%d%f%b'
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' format '%BCompleting: %F{cyan}%d%f%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' ignore-parents parent pwd .. directory
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original false
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt '%F{blue}%B%l%b \(%p\)%f'
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/nicole/.local/share/zeesh/compinstall.zsh'

autoload -Uz compinit
compinit
# End of lines added by compinstall
