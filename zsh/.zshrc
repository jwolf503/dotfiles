
# Set dir for zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

#Download Zinit if not there yet
if [ ! -d "$ZINIT_HOME" ]; then 
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

#Source|load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git 
zinit snippet OMZP::sudo 
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# Load completions
autoload -U compinit && compinit

# Open buffer line in editor
export EDITOR=hx

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# Suffix Aliases
alias -s md="$EDITOR"
alias -s mov="open"
alias -s png="open"
alias -s mp4="open"
alias -s go="$EDITOR"
alias -s js="$EDITOR"
alias -s yaml="$EDITOR"
alias -s json="jq <"

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybinds
bindkey -e
bindkey '^[[A' history-search-backward
bindkey '^p' history-search-backward
bindkey '^[[B' history-search-forward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

# History
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Alaises
source ~/aliases.txt
# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"


# Extras
#nitch++
/home/jay/.cargo/bin/macchina
export PATH="$PATH:/home/jay/.cargo/bin:/home/jay/.local/bin"
[ -f "/home/jay/.ghcup/env" ] && . "/home/jay/.ghcup/env" # ghcup-env
