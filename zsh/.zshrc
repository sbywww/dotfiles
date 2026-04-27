# Shell history settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS

# Zsh completion system
autoload -Uz compinit && compinit

# Sheldon — zsh plugin manager
eval "$(sheldon source)"

# Zoxide — smarter cd with frecency
eval "$(zoxide init zsh)"

# Fzf — fuzzy finder
eval "$(fzf --zsh)"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# PATH
export PATH="$HOME/.local/bin:$PATH"

# Starship — cross-shell prompt
eval "$(starship init zsh)"

# Mise — runtime version manager
eval "$(mise activate zsh)"

# Extra — personal preferences (shared in dotfiles)
[[ -f ~/.zshrc.extra ]] && source ~/.zshrc.extra

# Local — machine-specific overrides (not shared)
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local