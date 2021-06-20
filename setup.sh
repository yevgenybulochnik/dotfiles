#!/bin/bash
# Aboslute path of executed shell script
DIR="$( cd "$(dirname "${BASH_SOURCE[0]}")" && pwd )"

# Error Handling
cleanup() {
    exitcode=$?
    printf '\nError condition hit\n' 1>&2
    printf 'Exit code returned: %s\n' "$exitcode"
    printf 'The command executing at the time of the error was: %s\n' "$BASH_COMMAND"
    printf 'Command present on line: %d\n' "${BASH_LINENO[0]}"
    # Some more clean up code can be added here before exiting
    exit $exitcode
}

trap cleanup ERR

# Script functions
minimal_setup() {
    local DOT_FILES='
        .gitconfig
        .vimrc
    '
    for FILE in $DOT_FILES
    do
       ln -snf $DIR/$FILE ~
    done

    # Tab spacing here is screwy becuase of the heredoc
    cat > ~/.tmux.conf << EOF
set-option -g default-shell /bin/bash
set -g default-terminal "screen-256color"

#Set vi keybinding mode
setw -g mode-keys vi

#Quick reload .tmux.conf
bind r source-file ~/.tmux.conf

#Easier window split
bind \\ split-window -h -c "#{pane_current_path}"
bind - split-window -v -c "#{pane_current_path}"

#Alt resize window panes
bind -n M-a resize-pane -L
bind -n M-s resize-pane -D
bind -n M-d resize-pane -R
bind -n M-w resize-pane -U

#Map vim movement keys as pane movement keys with prefix
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
EOF
}

setup_dependencies() {
    if ! [ -x "$(command -v zsh)" ]
    then
        sudo apt install -y zsh
    else
        echo 'Skipping zsh install'
    fi

    if ! [ -x "$(command -v nvim)" ]
    then
        sudo wget https://github.com/neovim/neovim/releases/download/v0.4.4/nvim.appimage -O /usr/local/bin/nvim
        sudo chmod +x /usr/local/bin/nvim
    else
        echo 'Skipping nvim install'
    fi
}

dotfiles_setup() {
    local DOT_FILES='
        .gitconfig
        .zshrc
        .tmux.conf
    '
    for FILE in $DOT_FILES
    do
       ln -snf $DIR/$FILE ~
    done
}

neovim_setup() {
    mkdir -p ~/.config/nvim
    ln -snf $DIR/config/nvim/* ~/.config/nvim/
}

plug_setup() {
  curl -sfLo ~/.config/nvim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  nvim +PlugInstall +qall
}

tmux_plugin_setup() {
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ~/.tmux/plugins/tpm/bin/install_plugins
}

tmuxp_setup() {
    mkdir ~/.tmuxp
    ln -snf $DIR/tmuxp/* ~/.tmuxp
}

antigen_setup() {
  mkdir ~/.antigen
  curl -L git.io/antigen > ~/.antigen/antigen.zsh
}

# Argument parsing
PARAMS=""
SETUP="full"
while (( "$#" )); do
    case "$1" in
      -h|--help)
        SETUP='help'
        shift 1
        ;;
      -m|--minimal-setup)
        SETUP='minimal'
        shift 1
        ;;
      -u|--uninstall)
        SETUP='uninstall'
        shift 1
        ;;
      --) # end argument parsing
        shift
        break
        ;;
      -*|--*=) # unsupported flags
        echo "Error: Unsupported flag $1" >&2
        exit 1
        ;;
      *) # preserve positional arguments
        PARAMS="$PARAMS $1"
        shift
        ;;
    esac
done

# set positional arguments in their proper place
eval set -- "$PARAMS"

# Main script
if [ $SETUP == "help" ]
then
__usage="Dotfiles Setup Help:
    Invoking the setup script will execute a full install, including zsh, nvim, tmux, antigen and linking dofiles

Options:
    -h, --help            Show help screen
    -m, --minimal-setup   Minimal setup using vim
    -u, --uninstall       Delete linked dotfiles, does not remove deps
"
echo "$__usage"
fi

if [ $SETUP == "minimal" ]
then
    minimal_setup
fi

if [ $SETUP == "full" ]
then
    setup_dependencies
    dotfiles_setup
    neovim_setup
    plug_setup
    tmux_plugin_setup
    tmuxp_setup
    antigen_setup
fi

if [ $SETUP == "uninstall" ]
then
  CONFIGS='
  .tmux.conf
  .gitconfig
  .vimrc
  .vim
  .config/nvim
  .zshrc
  .tmuxp
  .antigen
  .tmux
  '
  for CONFIG in $CONFIGS
  do
    if [ -f $CONFIG ]
    then
      rm ~/$CONFIG
    elif [ -d $CONFIG ]
    then
      rm -rf ~/$CONFIG
    fi
  done
fi
