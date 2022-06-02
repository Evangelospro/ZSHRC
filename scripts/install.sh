#!/bin/bash
if [ -z "$(which zi)" ]; then
  export zi_home="$HOME/.zsh"
  echo "Installing zi in ${zi_home}/bin"
  git clone https://github.com/z-shell/zi.git "${zi_home}/bin"
  source ~/.zshrc
  zi self-update
  installing=true
fi
if [ -z "$(which zoxide)" ]; then
  echo "Installing zoxide"
  curl -sS https://webinstall.dev/zoxide | bash
  installing=true
fi 
if [ -z "$(which fuck)" ]; then
  echo "Installing thefuck"
  pip3 install thefuck --user
  installing=true
fi
# check if installing is true
if [ "$installing" = true ]; then
  echo "Symlinking and reloading shell"
  ln -s ~/.zsh/zshrc ~/.zshrc
  exec zsh
fi