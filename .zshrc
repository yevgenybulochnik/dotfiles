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

source /home/yevgeny/.antigen/.antigen.zsh

antigen use oh-my-zsh
antigen theme fishy
#antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship

# Antigen Bundles
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle z
antigen bundle pip

antigen apply
