#!/bin/bash

############### installs ###############

echo "Installing Homebrew..."
if ! command -v brew &> /dev/null
then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "skipping: Homebrew already installed."
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

echo "Installing Oh My Zsh..."
if ! $ZSH
then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "skipping: Oh My Zsh already installed"
fi

############## configs ###############

echo "symlink .vimrc"
ln .vimrc ~/.vimrc

echo "symlink .vim"
ln .vim ~/.vim

echo "symlink .config/nvim/init.vim"
NVIM_CONFIG_DIR=$HOME/.config/nvim
if [ ! -d $NVIM_CONFIG_DIR ]
then
  mkdir -p $NVIM_CONFIG_DIR
fi
ln .config/nvim/init.vim $NVIM_CONFIG_DIR/init.vim
