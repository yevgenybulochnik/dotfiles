# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/yevgeny/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# source antidote
source "$HOME/.antidote/antidote.zsh"
# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

bindkey '^f' autosuggest-accept

# Alias
alias vim="nvim"
alias poe="poetry"
alias k="kubectl"

# Pyenv Setup
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Poetry Setup
export POETRY_ROOT="$HOME/.poetry"
export PATH="$POETRY_ROOT/bin:$PATH"

# Libvirt Setup
export LIBVIRT_DEFAULT_URI='qemu:///system'

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export PL_FONTS=true
