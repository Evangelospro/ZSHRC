#!/bin/bash
venvs=$(ls -d ~/.virtualenvs/*/ | cut -d '/' -f5)
args='"$@"'
newline='\n'
aliases=""
for venv in $venvs; do
    aliases=$aliases"alias $venv='workon $venv; python3 $args'$newline"
done
echo -ne $aliases > ~/.zsh/scripts/venvs.zsh
