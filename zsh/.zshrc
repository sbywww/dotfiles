# --- Env (machine-specific) ---
[ -f ~/.env.user ] && source ~/.env.user

# --- History ---
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS

# --- Completion ---
autoload -Uz compinit && compinit

# --- Plugin ---
eval "$(sheldon source)"

# --- Tools ---
eval "$(zoxide init zsh)"
eval "$(fzf --zsh)"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"
eval "$(fnm env --use-on-cd)"

# --- Path ---
export PATH="$HOME/.local/bin:$PATH"

# --- Prompt (항상 마지막) ---
eval "$(starship init zsh)"

# --- Aliases ---
alias ls="eza --icons"
alias ll="eza --icons -la"
alias cat="bat"
alias diff="delta"
alias ta="tmux attach -t"
alias tks="tmux kill-server"
alias tkss="tmux kill-session -t"
alias tl="tmux list-sessions"
alias g="git"
alias cl="claude"
alias cld="claude --dangerously-skip-permissions --teammate-mode tmux"

# --- Yazi wrapper (cd to last dir on exit) ---
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
