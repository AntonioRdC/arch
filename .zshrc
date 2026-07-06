# ~/.zshrc

export EDITOR="${EDITOR:-code --wait}"
export VISUAL="$EDITOR"
export PAGER="${PAGER:-less}"
export LESS="-R"

HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history"
HISTSIZE=10000
SAVEHIST=10000
mkdir -p "${HISTFILE:h}"

setopt append_history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt inc_append_history
setopt auto_cd
setopt interactive_comments

autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
compinit

bindkey -e
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char

source_if_exists() {
    [[ -r "$1" ]] && source "$1"
}

source_if_exists /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source_if_exists /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

if (( ${+functions[history-substring-search-up]} )); then
    bindkey '^[[A' history-substring-search-up
    bindkey '^[[B' history-substring-search-down
fi

source_if_exists /usr/share/fzf/key-bindings.zsh
source_if_exists /usr/share/fzf/completion.zsh
source_if_exists "$HOME/.config/fzf/catppuccin-fzf-mocha.sh"

command -v zoxide >/dev/null 2>&1 && eval "$(zoxide init zsh)"
command -v starship >/dev/null 2>&1 && eval "$(starship init zsh)"

if command -v eza >/dev/null 2>&1; then
    export EZA_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/eza"
    alias ls='eza --icons=auto --group-directories-first'
    alias ll='eza -lah --icons=auto --group-directories-first --git'
    alias la='eza -a --icons=auto --group-directories-first'
    alias tree='eza --tree --icons=auto --group-directories-first'
else
    alias ls='ls --color=auto'
    alias ll='ls -lah --color=auto'
    alias la='ls -A --color=auto'
fi

command -v bat >/dev/null 2>&1 && alias cat='bat --style=plain --paging=never'
command -v duf >/dev/null 2>&1 && alias df='duf'

alias grep='grep --color=auto'
alias ..='cd ..'
alias ...='cd ../..'
alias c='clear'
alias ff='fastfetch'
alias dots='git --git-dir="$HOME/.dotfiles" --work-tree="$HOME"'

if [[ -o interactive && -t 1 && -z "${FASTFETCH_SHOWN:-}" ]]; then
    export FASTFETCH_SHOWN=1
    command -v fastfetch >/dev/null 2>&1 && fastfetch
fi

source_if_exists "$HOME/.config/zsh/themes/catppuccin_mocha-zsh-syntax-highlighting.zsh"
source_if_exists /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export PATH=$PATH:/home/ant/.spicetify
