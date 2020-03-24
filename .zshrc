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

source ~/.antigen/antigen.zsh

antigen use oh-my-zsh
antigen theme fishy

# Spaceship prompt settings
# antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship
# SPACESHIP_USER_COLOR=214
# SPACESHIP_DIR_COLOR=72
# SPACESHIP_HOST_COLOR_SSH=142
# SPACESHIP_GIT_BRANCH_COLOR=175

# Antigen Bundles
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle z
antigen bundle pip
antigen bundle tmux
antigen bundle debian
antigen bundle chrissicool/zsh-256color
antigen bundle endaaman/lxd-completion-zsh

antigen apply

# Alias
alias vim="nvim"
alias poe="poetry"

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
