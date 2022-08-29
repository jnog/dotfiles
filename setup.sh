#!/bin/bash

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

echo "Installing Oh My Zsh..."
if ! $ZSH
then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "skipping: Oh My Zsh already installed"
fi

echo "Installing Powerlevel10k theme"
if ! command -v p10k &> /dev/null
then
  brew install romkatv/powerlevel10k/powerlevel10k
else
  echo "skipping: Powerlevel10k already installed"
fi


############## fonts ##############

echo "symlink fonts"
ln "./fonts/MesloLGS NF Regular.ttf" \
   "./fonts/MesloLGS NF Bold.ttf" \
   "./fonts/MesloLGS NF Italic.ttf" \
   "./fonts/MesloLGS NF Bold Italic.ttf" \
   /Library/Fonts/

############## configs ###############
echo "symlink .gitmessage"
ln ./.gitmessage ~/.gitmessage
git config --global commit.template ~/.gitmessage

echo "symlink .zshrc"
ln .zshrc ~/.zshrc

echo "symlink .tmux.conf"
ln .tmux.conf ~/.tmux.conf

echo "symlink .p10k.zsh"
ln .p10k.zsh ~/.p10k.zsh

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
