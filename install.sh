#!/bin/bash
ls -s ~/.zsh/zshrc ~/.zshrc
ln -s ~/.zsh/zshenv ~/.zshenv

# check if it ubuntu then use apt
packages="zsh curl figlet lolcat neofetch python3-pip"
if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [ "$ID" = "ubuntu" ]; then
        sudo apt update
        sudo apt install -y $packages
    fi
# else check if arch
elif [ -f /etc/arch-release ]; then
    sudo pacman -Syy
    sudo pacman -Sy $packages
fi
ln -s ~/.zsh/zshenv ~/.zshenv
echo "Installing thefuck and notify send"
# check if the binary file exists .local/bin/zoxide
if [ ! -f ~/.local/bin/zoxide ]; then
  echo "Installing zoxide"
  curl -sS https://webinstall.dev/zoxide | bash
  installing=true
fi
export zi_home="$HOME/.zsh/.zi"
# check if the .zi directory exists
if [ ! -d "$zi_home/bin" ]; then
    echo "Installing zi in ${zi_home}/bin"
    mkdir -p "$zi_home/bin"
    git clone https://github.com/z-shell/zi.git "${zi_home}/bin"
    source ~/.zshrc
    zi self-update
    installing=true
fi
# check if installing is true
if [ "$installing" = true ]; then
  echo "Symlinking and reloading shell"
  zsh
fi