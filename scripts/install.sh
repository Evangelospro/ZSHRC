#!/bin/bash
ln -s ~/.zsh/zshenv ~/.zshenv
ln -s ~/.zsh/zshrc ~/.zshrc
pip3 freeze |grep -q thefuck
if [ $? -eq 1 ]; then
  echo "Installing thefuck"
  pip3 install thefuck --user
  installing=true
fi
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
  exec zsh
fi