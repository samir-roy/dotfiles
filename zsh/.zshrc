# setup nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# clear buffer on clear command
alias clear="clear && printf '\e[3J'"

# alias for neovim
alias vi="nvim"

# tmux alias for session (default: main)
mux() { /opt/homebrew/bin/tmux new-session -A -s "${1:-main}"; }

# l alias for ls -al
alias l="ls -alh"

# enable command line colors
export CLICOLOR=1

# git autocomplete
autoload -Uz compinit && compinit

# configure prompt
PROMPT='%F{240}%@%f %B%F{240}%2~%f%b %# '

# update time in prompt on keystroke
update-prompt-on-keystroke() {
  zle reset-prompt
  zle .accept-line
}
zle -N accept-line update-prompt-on-keystroke

# enable terminal focus tracking
autoload -U add-zsh-hook
add-zsh-hook precmd () { printf '\e[?1004h' }

# update prompt on focus in
focus-in-update-prompt() {
  zle reset-prompt
}
zle -N focus-in-update-prompt
bindkey '\e[I' focus-in-update-prompt

# do nothing on focus out
focus-out-noop() { }
zle -N focus-out-noop
bindkey '\e[O' focus-out-noop

# disable focus tracking on exit to avoid leaking escape codes
zshexit() {
  printf '\e[?1004l'
}

# remap up/down arrow keys
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# set neovim as default editor
export EDITOR=nvim

# switch node versions when entering a directory
# autoload -U add-zsh-hook
# load-nvmrc() {
#   local node_version="$(nvm version)"
#   local nvmrc_path="$(nvm_find_nvmrc)"

#   if [[ -n "$nvmrc_path" ]]; then
#     local nvmrc_node_version="$(nvm version $(cat "$nvmrc_path"))"

#     if [[ "$nvmrc_node_version" != "$node_version" ]]; then
#       nvm use
#     fi
#   elif [[ "$node_version" != "$(nvm version default)" ]]; then
#     echo "Reverting to nvm default version"
#     nvm use default
#   fi
# }
# add-zsh-hook chpwd load-nvmrc

# check node version before running npm if .nvmrc exists
npm() {
  if [[ -f .nvmrc ]]; then
    local required_version=$(cat .nvmrc | tr -d '[:space:]' | sed 's/^v//' | cut -d. -f1)
    local current_version=$(node --version | sed 's/^v//' | cut -d. -f1)

    if [[ "$current_version" != "$required_version" ]]; then
      echo "⚠️ Error: .nvmrc specifies Node $required_version but you're on $(node --version)"
      return 1
    fi
  fi
  command npm "$@"
}
