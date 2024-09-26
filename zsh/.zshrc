# setup nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# clear buffer on clear command
alias clear="clear && printf '\e[3J'"

# enable command line colors
export CLICOLOR=1

# git autocomplete
autoload -Uz compinit && compinit

# configure prompt
PROMPT='%B%F{240}%2~%f%b %# '

# remap up/down arrow keys
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# set neovim as default editor
export EDITOR=nvim
