# root privileges
alias s='sudo !!'

# Hacking platforms 
alias thm="~/.local/bin/thm/thm"
alias htb="~/.local/bin/htb/htb"

# Seafile exec workaround
alias r=~/SCRIPTS/r

# HACKING TOOLS
alias stego="~/Desktop/HACKING/HACKING-TOOLS/Setup-Scripts/stego/stego"
alias steganabara="~/Desktop/HACKING/HACKING-TOOLS/Stego/Steganabara/run"
alias pwnsetup='python3 ~/Desktop/HACKING/HACKING-TOOLS/Setup-Scripts/pwnsetup'
alias penelope='python3 ~/Desktop/HACKING/HACKING-TOOLS/Setup-Scripts/penelope/penelope.py -r ~/Desktop/HACKING/HACKING-TOOLS/Setup-Scripts/penelope/extras/penelope.conf'
alias cerbrutus='python3 ~/.local/bin/cerbrutus/cerbrutus.py'
alias autorecon='autorecon --only-scans-dir --single-target'
alias rot13='tr '\''A-Za-z'\'' '\''N-ZA-Mn-za-m'\'
alias rot47='tr '\''\!-~'\'' '\''P-~\!-O'\'
alias rr='nc evangelospro.codes 1337'
alias webserver='updog -p 8000'
alias rustscan='~/SCRIPTS/r ~/Desktop/HACKING/HACKING-TOOLS/Setup-Scripts/rustscan'
alias pwncompile='gcc -fno-stack-protector -z execstack -no-pie'
alias pwndocker='~/Desktop/HACKING/CTF\ Automation/pwndocker.sh'
alias ctfinit='python3 ~/Desktop/HACKING/CTF\ Automation/ctfinit.py'
alias mobsf='~/Desktop/HACKING/HACKING-TOOLS/Mobile/Mobile-Security-Framework-MobSF/run.sh'
alias curl='curlie'
alias burl='curl -x localhost:8080 -k '
alias frm='/usr/bin/rm -rf'
alias rm='trash-put'
alias rmz='rm *.zip'
alias pcapng-to-pcap='~/Desktop/HACKING/HACKING-TOOLS/Setup-Scripts/pcapng-to-pcap'
alias pwndbg='gdb -q -ex init-pwndbg "$@"'
alias hosts='sudo ~/Desktop/HACKING/hosts.sh'
alias chosts='echo "127.0.0.1 localhost"|sudo tee /etc/hosts'
alias navi-update="$ZSH/scripts/navi-updater.sh"
alias feroxbuster="feroxbuster -e"
alias wpscan='wpscan --plugins-detection aggressive'

# venvs for each venv ~/.virtualenvs
source $ZSH/scripts/venvs.zsh

# Grub
alias grub-update='sudo grub-mkconfig -o /boot/grub/grub.cfg'

# clipboard
alias copy='xclip -selection clipboard'
alias paste='xclip -selection clipboard -o'
alias copydir='pwd | tr -d '\n' |copy|paste'

# exa/lsd ignore on --tree
alias ls='lsd -hAFlt --group-dirs first --color=always'
alias lst='lsd -hAFlt --tree --group-dirs first --color=always'

# Command minimization
alias -- -='cd -'
alias reload='exec zsh -l'
alias ssh='~/SCRIPTS/ssh'
alias sshz='~/SCRIPTS/sshz'
alias mvd='mv ~/Downloads/"$(/usr/bin/ls -t ~/Downloads | head -n 1)" .'
alias cat='/usr/bin/bat --theme=Dracula'
alias icat="kitty +kitten icat"
alias panel="kitty +kitten panel"
alias df='df -h'
alias diff='diff --color'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias free='free -m'
alias g=git
alias ga='git add'
alias jctl='journalctl -p 3 -xb'
alias pipir='pip install -r requirements.txt'
alias pipreq='pip freeze > requirements.txt'
alias pipua='pip list | cut -d " " -f1 | tail +3 | xargs pip install -U'
alias protostar='sudo qemu-system-x86_64 -enable-kvm -hda ~/Desktop/Virtual\ Machines/image.img -cdrom ~/Desktop/Virtual\ Machines/ProtoStar/exploit-exercises-protostar-2.iso -m 3G -nic user,hostfwd=tcp::8888-:22 -boot order=dc'
alias psa='ps auxf'
alias pscpu='ps auxf | sort -nr -k 3'
alias psgrep='ps aux | grep -v grep | grep -i -e VSZ -e'
alias psmem='ps auxf | sort -nr -k 4'
alias server='ssh -i ~/.ssh/server evangelospro@evangelospro.codes'
alias lserver='ssh -i ~/.ssh/lserver eliou@192.168.10.26'
alias eraspberry1='ssh evangelospro@192.168.10.35'
alias eraspberry2='ssh evangelospro@192.168.10.49'
alias termbin='nc termbin.com 9999|copy'
alias tobash='sudo chsh evangelospro -s /bin/bash && echo '\''Now log out.'\'
alias tozsh='sudo chsh evangelospro -s /bin/zsh && echo '\''Now log out.'\'
alias which-command=whence
alias wmonitor-off='sudo airmon-ng stop wlxd0374563940f'
alias wmonitor-on='sudo airmon-ng start wlxd0374563940f'
alias zshconfig="code $ZSH"
alias pip='noglob pip3'
alias p='python3'
alias docker-clean='docker system prune -f'
alias fd='fd --hidden --follow'
alias e="code"
alias q='exit'
alias hexdump='od -A x -t x1z -v'
alias ip='ip -color -brief'
alias o='xdg-open'
alias tree='tree -a -I .git --dirsfirst'
alias utc='env TZ=UTC date'
alias clear="$ZSH/scripts/clear.sh"
alias md='mdv'
alias git-update="find . -name .git -type d -print -prune -exec git --git-dir '{}' fetch --all ';'"
