# My handy dotfiles on Ubuntu :fish_cake::fire:

>Leonardo Rivas 2023-05-27

**Hi there, this is my dotfiles collection for Ubuntu, if you like something take it, Thanks for dropping by!** :heart_on_fire:

## ‎ Introduction :shipit:

This repository started out of my necesity of having a reliable and consisten way of keeping track of my dotfiles for every time I need to make a new install, wich is very frequently(I know, I need to stop).

Here you'll find a series of tools, programs and configuration files that make up for my working enviroment.


## :pushpin: ‎ Notes

:rotating_light: nevermind

<!-- INFORMATION -->

## :warning: ‎ <samp>Information</samp>


Here are some details about my setup:

| Tool   | Link|
|--------|--------------------------------------------------------|
| **OS**| [Ubuntu Desktop 23.04](https://ubuntu.com/download/desktop)|
| **Terminal** | [wezterm](https://wezfurlong.org/wezterm/)|
| **Terminal2** | [kitty](https://github.com/kovidgoyal/kitty) |
| **Interactive Shell** | [zsh](https://www.zsh.org/)|
| **Editor** | [neovim](https://github.com/neovim/neovim) / [vscode(from snap)](https://github.com/microsoft/vscode)|
| **nvim Configs** | [nvchad](https://nvchad.com/)|
| **Apt Frontend** | [nala](https://gitlab.com/volian/nala)|
| **Prompt** | [powerlevel10k](https://github.com/romkatv/powerlevel10k#what-is-the-best-prompt-style-in-the-configuration-wizard)|

**In the case of a Tiling Window Manager**

| Tool   | Link|
|--------|--------------------------------------------------------|
|**WM** | [bspwm](https://github.com/baskerville/bspwm)|
|**Application Launcher**| [rofi](https://github.com/davatorium/rofi)|
|**Music Player** | [ncmpcpp](https://github.com/ncmpcpp/ncmpcpp)|
<!-- SETUP -->

## :wrench: ‎ <samp>Setup</samp>

### Install script

To install with script:
```
wget -qO- https://raw.githubusercontent.com/lrivas3/Dotfiles-Ubuntu/main/install.sh | bash
```

## :hammer: Manual configuration

### Required 

**The following packages are required for the enviroment**


<details>
    <summary>Click me</summary>

- git
- powerlevel10k
- nala
- wezterm 
- Kitty
- neofetch
- cava
- fzf
- neovim
- ranger
- git
- lsd
- batcat
- nvm
    - nodejs
    - npm
- python
- pip

From apt
```
sudo apt install zsh ranger curl kitty neofetch cava fzf lsd bat nvm python python-pip 
```
From snap
```
snap install nvim --classic
```
powerlevel10k
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
```
wezterm
```
wget -P /tmp https://github.com/wez/wezterm/releases/download/20230408-112425-69ae8472/wezterm-20230408-112425-69ae8472.Ubuntu22.04.deb && sudo apt install /tmp/wezterm-20230408-112425-69ae8472.Ubuntu22.04.deb && rm /tmp/wezterm-20230408-112425-69ae8472.Ubuntu22.04.deb
```

</details>


### zsh plugins

<details>
    <summary>Click me</summary>

#### From Github

- [zsh-z](https://github.com/agkozak/zsh-z)
- [zsh-sudo](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/sudo)
- [zsh-you-should-use](https://github.com/MichaelAquilina/zsh-you-should-use)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)

</details>

**To continue with the manual configuration:**

```
#clone the repository

git clone https://github.com/lrivas3/Dotfiles-Ubuntu

#copy the configuration folders to de system configs folder

cp -r config/* ~/.config/

# copy the files meant to be at the home folder, like .zshrc and stuff 

# Well I think you know what you're doing
```
 
Thanks for stopping by and enjoy the dots.

