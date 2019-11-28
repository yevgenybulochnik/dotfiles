#!/bin/bash
#Aboslute path of executed shell script
DIR="$( cd "$(dirname "${BASH_SOURCE[0]}")" && pwd )"

#Loop through dotfiles and create sym links in ~
DOT_FILES='
.gitconfig
.tmux.conf
.zshrc
'

for FILE in $DOT_FILES
do
   ln -snf $DIR/$FILE ~
done

NEOVIM_LINKS='
ftplugin
settings
init.vim
plugins.vim
'

#Create .config dir and symlink neovim files and dirs
mkdir -p ~/.config/nvim
for LINK in $NEOVIM_LINKS
do
    ln -snf $DIR/config/nvim/$LINK ~/.config/nvim/
done

#Setup vim-plug and install plugins
curl -sfLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim +PlugInstall +qall

# Install tmux-plugin
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins
