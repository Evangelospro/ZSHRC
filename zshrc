# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.zsh/p10k.zsh.
[[ ! -f ~/.zsh/p10k.zsh ]] || source ~/.zsh/p10k.zsh

# evaluting some useful commands
eval $(thefuck --alias)
eval "$(zoxide init zsh --no-aliases --hook pwd)"
eval '$(~/.zsh/scripts/venv_finder.sh)'

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Loading ZI
source "${zi_home}/bin/zi.zsh"

eval '$(~/.zsh/scripts/install.sh)'

# Using normal load works
zi depth=1 lucid nocd for \
    romkatv/powerlevel10k

# PLUGINS
zi ice wait
zi snippet OMZP::dirhistory

zi ice wait
zi snippet ~/.zsh/web-search/web-search.zsh

zi ice wait
zi light MichaelAquilina/zsh-you-should-use

zi ice wait
zi light MichaelAquilina/zsh-auto-notify # requires a gui server like xorg can't run on servers

# ZSH AUTOCOMPLETION
zi ice wait
zi light marlonrichert/zsh-autocomplete

zi ice wait
zi light tom-doerr/zsh_codex

zi ice wait
zi light RobSis/zsh-completion-generator

# autocompletions addition + fast-syntax-highlighting + zsh-autosuggestions
zi wait lucid for \
 atinit"ZI[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    z-shell/F-Sy-H \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi

case ${TERM} in
  xterm*|rxvt*|Eterm*|aterm|kterm|terminator|gnome*|alacritty|st|konsole*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
        ;;
  screen*)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
    ;;
esac

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# load aliases at the end to overwrite framework set aliases
source ~/.zsh/aliases.zsh

HISTFILE=~/.zsh/zsh_history.zsh
SAVEHIST=1000000000
HISTSIZE=99999

# History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

# Other setopts
setopt EXTENDED_GLOB
setopt GLOBDOTS
setopt NOTIFY
setopt AUTOCD

source ~/.zsh/functions.zsh

# source ~/.zsh/themes/dracula.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
~/.zsh/scripts/clear.sh