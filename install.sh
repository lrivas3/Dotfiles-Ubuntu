#!/bin/sh

if command -v git >/dev/null 2>&1; then
  mkdir -p ~/Dotfiles
  git clone --depth=1 https://github.com/lrivas3/Dotfiles-Ubuntu.git ~/Dotfiles/Dotfiles-Ubuntu
else 
  echo "Git is not installed. Installing Git..."
  sudo apt update 
  sudo apt install -y git
  echo "Git installation completed."
fi

BASE_DIR=~/Dotfiles/Dotfiles-Ubuntu/

mkdir -p ~/.local/share/fonts/ && FONTS_DIR=~/.local/share/fonts/

echo "Copying config files to desired destination"
echo "Copying zsh files"
ln -s $BASE_DIR/.zshrc ~/.zshrc
ln -s $BASE_DIR/.zsh ~/.zsh
echo "Setting up terminals configs"
ln -s $BASE_DIR/config/kitty ~/.config/kitty
ln -s $BASE_DIR/config/wezterm ~/.config/wezterm
echo "Copying and reloading fonts"
ln -s $BASE_DIR/fonts $FONTS_DIR/
sudo fc-cache -f -v
echo "Setting up gitconfig file"
ln -s $BASE_DIR/.gitconfig ~/

echo "Copying zsh plugins to zsh directory"
sudo cp $BASE_DIR/zsh/plugins /usr/share/zsh/

echo "installing packages with apt"
sudo apt install zsh ranger kitty neofetch cava fzf lsd bat nvm python3 python3-pip nala

snap install nvim --classic

echo "Setting up powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo "Installing nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash


echo "DONE!!"
