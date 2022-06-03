#!/bin/bash
ln -s ~/.zsh/zshrc ~/.zshrc
ln -s ~/.zsh/zshenv ~/.zshenv

get_latest_release() {
# find the computer architecture
  arch=$(uname -m)
  case $arch in
      x86_64)
          arch="amd64"
          ;;
      armv6l)
          arch="arm6l"
          ;;
      armv7l)
          arch="arm7l"
          ;;
      aarch64)
          arch="arm64"
          ;;
      *)
          echo "Unknown architecture: $arch"
          exit 1
          ;;
  esac
curl -s https://api.github.com/repos/$1/releases/latest \
| grep "browser_download_url.*deb" \
| grep $arch \
| grep -v "musl" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -
}

# check if it is debian then use apt
packages="zsh curl figlet lolcat neofetch python3-pip"
if [ -f /usr/bin/apt ]; then
    sudo apt update
    sudo apt install -y $packages python-is-python3
    get_latest_release "Peltoche/lsd"
    sudo dpkg -i lsd*
    rm lsd*

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