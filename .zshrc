# Start timer (for profiling if needed)
# zmodload zsh/zprof

# Path to Oh My Zsh (keep this if you use it)
export ZSH="$HOME/.oh-my-zsh"
ZSH_DISABLE_COMPFIX=true  # Optional: Disable compfix if you don't need it
ZSH_THEME="robbyrussell" # Or your preferred theme

# Plugins (keep your plugin list here)
plugins=(
    git
)

# Lazy-load NVM (as you already have - this is good!)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin
# load_nvm() {
#   [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
# }
# alias nvm="load_nvm; nvm"
# alias node="load_nvm; node"
# alias npm="load_nvm; npm"
# alias pnpm="load_nvm; pnpm"
# alias yarn="load_nvm; yarn"
# alias zshstart="time zsh -lic 'exit'"

# Source Oh My Zsh (keep this if you use it)
source $ZSH/oh-my-zsh.sh

# Dotfiles management
export DOTFILES="$HOME/dotfiles"

# Aliases (keep your aliases here)
alias zshconfig="nvim $DOTFILES/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias szsh="source ~/.zshrc"
alias vim="nvim"
alias dotfiles="cd $DOTFILES"

# Disable Oh My Zsh Updates (optional)
zstyle ':omz:update' mode disabled


# Defer compinit (THE KEY IMPROVEMENT)
autoload -Uz compinit
typeset -g compinit_done=0  # Global flag

precmd() {
  if [[ $compinit_done -eq 0 ]]; then
    compinit
    compinit_done=1
  fi
}

# Optimize FZF Loading (as you already have - this is good!)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ... any other custom settings ...

# End timer (for profiling if needed)
# zprof
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/aa/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Python/pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# Load private environment variables (recommended for API keys)
[ -f ~/.env.local ] && source ~/.env.local

alias python=python3