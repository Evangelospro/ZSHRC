#!/bin/bash
ln -s ~/.zsh/zshrc ~/.zshrc
ln -s ~/.zsh/zshenv ~/.zshenv

# check if it is debian then use apt

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

packages="zsh curl figlet lolcat neofetch python3-pip"
if [ -f /usr/bin/apt ]; then
    sudo apt update
    sudo apt install -y $packages
    lsd_version=$(get_latest_release "Peltoche/lsd") 
    wget "https://github.com/Peltoche/lsd/releases/download/"$lsd_version"/lsd-amd64"$_lsd_version"_amd64.deb"
    sudo dpkg -i "lsd-amd64"$_lsd_version"_amd64.deb"

# else check if arch
elif [ -f /etc/arch-release ]; then
    sudo pacman -Syy
    sudo pacman -Sy $packages lsd
fi

# Figlet fonts
git clone https://github.com/xero/figlet-fonts
sudo mv figlet-fonts/* /usr/share/figlet/
rm -rf figlet-fonts

echo "Installing thefuck and notify send"
pip3 install thefuck notify-send --user

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
if [ "$installing" == true ]; then
  echo "Reloading shell"
  exec zsh
fi