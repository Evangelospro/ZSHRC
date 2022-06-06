# Autonotify when a long command has been completed
export AUTO_NOTIFY_THRESHOLD=450
export AUTO_NOTIFY_TITLE="Boss! the command: %command has just finished"
export AUTO_NOTIFY_BODY="Time taken: %elapsed seconds exit code: %exit_code, have a look"
export AUTO_NOTIFY_IGNORE=("htb", "thm", "ipython", "docker" "man","nano","vim","ssh","less","e","openvpn","ping","nc","penelope",'xxh','kitty')
export AUTO_NOTIFY_EXPIRE_TIME=4

# Setting program home directory
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk/"
export GEM_HOME=~/.ruby/
export WORKON_HOME=~/.virtualenvs
source ~/.local/bin/virtualenvwrapper.sh
export ZSH=~/.zsh

# Adding to the PATH
export PATH=$PATH:~/.cargo/bin/
export PATH=$PATH:~/.local/bin/
export PATH=$PATH:~/bin/
export PATH=$PATH:~/.ruby/bin/
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$GOPATH/bin"

export _ZO_DATA_DIR="$ZSH/zoxide"
skip_global_compinit=1

export zi_home="$HOME/.zsh/.zi"