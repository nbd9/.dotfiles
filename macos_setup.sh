echo "Sym-Linking Fish Files"
ln -sF "$HOME/.dotfiles/fish" "$HOME/.config"

echo "Sym-Linking Git Files"
mkdir "$HOME/.gitshots"
ln -sF "$HOME/.dotfiles/.gitconfig" "$HOME"

# Install Brew
echo "Installing Brew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Brew CLI Programs
echo "Installing Brew Programs"
brew bundle

# VSCode Settings Sync Extension
echo "Installing VS Code Settings"
mkdir -p "$HOME/Library/Application\ Support/Code/User"
ln -sF "$HOME/.dotfiles/VSCode/settings.json" "$HOME/Library/Application\ Support/Code/User/settings.json"

# Set up terminal
echo "Setting up Terminal"
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$HOME/.dotfiles/iTerm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# Key Repeat Fix
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 2

echo "Done! You're good to go."
