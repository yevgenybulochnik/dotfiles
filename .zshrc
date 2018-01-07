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
#antigen theme https://github.com/denysdovhan/spaceship-zsh-theme spaceship

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

antigen apply

if [ -d ~/node_modules ]
then
    path+=~/node_modules/.bin
fi
