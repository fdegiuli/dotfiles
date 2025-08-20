#!/usr/bin/env fish
set -eux

echo "Setting up fish shell..."

set DOTFILES $HOME/dotfiles

# Install fish config
echo "Installing fish config..."
ln -sf  $DOTFILES/fish/config.fish ~/.config/fish/config.fish
# Make fish recognize Homebrew's binaries
echo "Adding Homebrew to fish PATH..."
fish_add_path "/opt/homebrew/bin/"

# ## Enable fzf
# echo "enabling fzf..."
# set brew_prefix (brew --prefix)
# $brew_prefix/opt/fzf/install

# Create completion files
echo "Updating fish completions..."
fish_update_completions

# Install fisher plugin manager
echo "Installing fisher plugin manager..."
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

# Install fisher plugins
echo "Installing fisher plugins..."
ln -f ~/.config/fish/fish_plugins $DOTFILES/fish/fish_plugins
fisher update

# Install fish aliases
echo "Installing aliases..."
cp $DOTFILES/fish/functions/* ~/.config/fish/functions/


# TDOO: this can be automated by moving the fish_prompt.fish function to dotfiles
read -P "Run 'fish_config' to choose a prompt? ('informative vcs' is nice) (Y/n): " choice
if test (string lower -- $choice) = "n"
    echo "Skipping fish_config..."
else
    fish_config
end

echo "Fish setup complete!"
echo "You may need to restart your terminal or run 'source ~/.config/fish/config.fish' to apply changes."
