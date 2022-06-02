if [ -z "$(which zi)" ]; then
  echo "Installing zi"
  git clone https://github.com/z-shell/zi.git ~/.zsh/zi
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