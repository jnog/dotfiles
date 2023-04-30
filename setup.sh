#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "$BASH_SOURCE[0]}" )" &> /dev/null && pwd )

############### installs ###############

echo "Installing Homebrew..."
if ! command -v brew &> /dev/null
then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "skipping: Homebrew already installed."
fi

echo "Installing node..."
if ! command -v node &> /dev/null
then
  brew install node
else
  echo "skipping: node already installed."
fi

echo "Installing yarn..."
if ! command -v yarn &> /dev/null
then
  npm install --global yarn
else
  echo "skipping: yarn already installed."
fi

echo "Installing neovim..."
if ! command -v nvim &> /dev/null
then
  brew install nvim
else
  echo "skipping: neovim already installed"
fi

echo "Installing vim..."
if ! command -v vim &> /dev/null
then
  brew install vim
else
  echo "skipping: vim already installed"
fi

echo "Installing Powerlevel10k theme"
if ! command -v p10k &> /dev/null
then
  brew install romkatv/powerlevel10k/powerlevel10k
else
  echo "skipping: Powerlevel10k already installed"
fi

echo "Installing Tmux Plugin Manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

############## fonts ##############

echo "Installing Nerd Fonts"
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
echo "symlink fonts"
 ln -f "$SCRIPT_DIR/fonts/MesloLGS NF Regular.ttf" \
   "$SCRIPT_DIR/fonts/MesloLGS NF Bold.ttf" \
   "$SCRIPT_DIR/fonts/MesloLGS NF Italic.ttf" \
   "$SCRIPT_DIR/fonts/MesloLGS NF Bold Italic.ttf" \
   /Library/Fonts/

############## configs ###############
echo "symlink .gitmessage"
 ln -f $SCRIPT_DIR/.gitmessage ~/.gitmessage
git config --global commit.template ~/.gitmessage

echo "symlink .zshrc"
 ln -f $SCRIPT_DIR/.zshrc ~/.zshrc

echo "symlink .tmux.conf"
 ln -f $SCRIPT_DIR/.tmux.conf ~/.tmux.conf

echo "symlink .p10k.zsh"
 ln -f $SCRIPT_DIR/.p10k.zsh ~/.p10k.zsh

echo "symlink .vimrc"
 ln -f $SCRIPT_DIR/.vimrc ~/.vimrc

echo "symlink .vim"
 ln -f $SCRIPT_DIR/.vim ~/.vim

echo "symlink .config/nvim/init.vim"
NVIM_CONFIG_DIR=$HOME/.config/nvim
if [ ! -d $NVIM_CONFIG_DIR ]
then
  mkdir -p $NVIM_CONFIG_DIR
fi
ln -f $SCRIPT_DIR/.config/nvim/init.vim $NVIM_CONFIG_DIR/init.vim

echo "symlink .zgen/zgen.zsh"
ZGEN_DIR=$HOME/.zgen
if [ ! -d $ZGEN_DIR ]
then
  mkdir -p $ZGEN_DIR
fi
ln -f $SCRIPT_DIR/.zgen/zgen.zsh $ZGEN_DIR/zgen.zsh
