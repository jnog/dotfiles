#!/bin/bash

echo "Installing Homebrew..."
if ! command -v brew &> /dev/null
then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "skipping: Homebrew already installed."
fi

echo "Installing vim..."
if ! command -v vim &> /dev/null
then
  brew install vim
else
  echo "skipping: vim already installed"
fi

echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "symlink .vimrc"
ln -s .vimrc ~/.vimrc

echo "symlink .vim"
ln -s .vim ~/.vim

echo "symlink .zshrc"
ln -s .zshrc ~/.zshrc
