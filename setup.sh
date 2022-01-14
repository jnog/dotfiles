#!/bin/bash

# install homebrew
echo "Installing Homebrew..."
if ! command -v brew &> /dev/null
then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "skipping: Homebrew already installed."
fi

# install and setup vim
echo "Installing vim..."
if ! command -v vim &> /dev/null
then
  brew install vim
else
  echo "skipping: vim already installed"
fi

# install Oh My Zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
