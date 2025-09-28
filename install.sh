#!/bin/bash

# Dotfiles installation script
DOTFILES_DIR="$HOME/dotfiles"

echo "Setting up dotfiles..."

# Create .config directory if it doesn't exist
mkdir -p ~/.config

# Function to create symlink with backup
create_symlink() {
    local source="$1"
    local target="$2"

    if [ -e "$target" ] || [ -L "$target" ]; then
        echo "Backing up existing $target to $target.backup"
        mv "$target" "$target.backup"
    fi

    echo "Creating symlink: $target -> $source"
    ln -sf "$source" "$target"
}

# Symlink .zshrc
create_symlink "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

# Symlink tmux config
create_symlink "$DOTFILES_DIR/.config/.tmux.conf" "$HOME/.tmux.conf"

# Symlink nvim config
create_symlink "$DOTFILES_DIR/.config/nvim" "$HOME/.config/nvim"

echo "Dotfiles setup complete!"
echo "Don't forget to source your shell: source ~/.zshrc"