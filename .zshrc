if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Load the prompt
eval "$(oh-my-posh init zsh --config ~/shell-prompt.yaml)"

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Load completions
autoload -Uz compinit && compinit

# Add in zsh plugins
zinit light Aloxaf/fzf-tab
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light jeffreytse/zsh-vi-mode

# Keybindings
bindkey -v
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
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

# Completions
kubectl completion zsh > "${fpath[1]}/_kubectl"

# Shell integrations
eval "$(fzf --zsh)"

# Aliases
alias ls='eza --group-directories-first'
alias k='kubectl'
alias kg='kubectl get'
alias kd='kubectl describe'
alias kgp='kubectl get pods'
alias kdp='kubectl describe pods'
alias kr='kubectl api-resources'
alias lg='lazygit'
alias pip='pip3'

# Default Editor
export EDITOR=nvim

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/runit.misra/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$(go env GOPATH)/bin:$PATH"
export PATH="$HOME/.kopsenv/bin:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:/Users/runit.misra/.kube/kubediff"

# Created by `pipx` on 2024-11-14 07:42:44
export PATH="$PATH:/Users/runit.misra/.local/bin"

# GO env vars
export GO111MODULE=on

# Added by Windsurf
export PATH="/Users/runit.misra/.codeium/windsurf/bin:$PATH"

# fetch
fastfetch -c ~/fastfetch.jsonc

alias claude="/Users/runit.misra/.claude/local/claude"

# opencode
export PATH=/Users/runit.misra/.opencode/bin:$PATH
