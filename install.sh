#!/bin/sh

if command -v git >/dev/null 2>&1; then
  mkdir -p ~/Dotfiles
  git clone --depth=1 https://github.com/lrivas3/Dotfiles-Ubuntu.git ~/Dotfiles/Dotfiles-Ubuntu
else 
  echo "Git is not installed. Installing Git..."
  sudo apt update 
  sudo apt install -y git
  echo "Git installation completed."
  mkdir -p ~/Dotfiles
  git clone --depth=1 https://github.com/lrivas3/Dotfiles-Ubuntu.git ~/Dotfiles/Dotfiles-Ubuntu
fi

BASE_DIR=~/Dotfiles/Dotfiles-Ubuntu

mkdir -p ~/.local/share/fonts/

echo "Copying config files to desired destination"
echo "Copying zsh files"
ln -s $BASE_DIR/.zshrc ~/.zshrc
ln -s $BASE_DIR/.zsh ~/.zsh
echo "Setting up terminals configs"
ln -s $BASE_DIR/config/kitty ~/.config/kitty
ln -s $BASE_DIR/config/wezterm ~/.config/wezterm


echo "Setting up gitconfig file"
ln -s $BASE_DIR/.gitconfig ~/


echo "installing packages with apt"
sudo apt install zsh curl ranger kitty neofetch cava fzf lsd bat python3 python3-pip nala
echo "Installing nvim"
sudo snap install nvim --classic
echo "Installing config files for nvim"
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 
echo "Installing wezterm"
wget -P /tmp https://github.com/wez/wezterm/releases/download/20230408-112425-69ae8472/wezterm-20230408-112425-69ae8472.Ubuntu22.04.deb && sudo apt install /tmp/wezterm-20230408-112425-69ae8472.Ubuntu22.04.deb && rm /tmp/wezterm-20230408-112425-69ae8472.Ubuntu22.04.deb


echo "Setting up powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo "Installing nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

echo "Installing zsh plugins"
sudo mkdir -p /usr/share/zsh/plugins && cd /usr/share/zsh/plugins/
# z
sudo git clone https://github.com/agkozak/zsh-z.git
# sudo
sudo mkdir -p zsh-sudo && sudo wget -P ./zsh-sudo https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh 
# you should use
sudo git clone https://github.com/MichaelAquilina/zsh-you-should-use.git
# autosuggestions
sudo git clone https://github.com/zsh-users/zsh-autosuggestions.git
# highlighting
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
# zsh-history-substring-search
sudo git clone https://github.com/zsh-users/zsh-history-substring-search.git

cd

source ~/.zshrc

echo "DONE!!"
