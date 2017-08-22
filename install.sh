#Aboslute path of executed shell script
DIR="$( cd "$(dirname "${BASH_SOURCE[0]}")" && pwd )"

#Loop through dotfiles and create sym links in ~
DOT_FILES='
.gitconfig
.vimrc
.tmux.conf
'

for FILE in $DOT_FILES
do
   ln -snf $DIR/$FILE ~
done

#Clone vundle and install plugins
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall