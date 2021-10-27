echo "Sym-Linking Fish Files"
mkdir "$HOME/.config"
ln -sF "$HOME/.dotfiles/fish" "$HOME/.config"

echo "Installing Fisher and Plugins"
curl -sL https://git.io/fisher | source
fisher install jorgebucaran/fisher
fisher install jethrokuan/z

echo "Sym-Linking Git Files"
ln -sF "$HOME/.dotfiles/.gitconfig" "$HOME"

# Install Brew
echo "Installing Brew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Brew CLI Programs
echo "Installing Brew Programs"
brew bundle

echo "Linking and Installing asdf tools"
ln -sF "$HOME/.dotfiles/.tool-versions" "$HOME"
asdf install

# Set up terminal
echo "Setting up Terminal"
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$HOME/.dotfiles/iTerm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# Key Repeat Fix
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 2

echo "Done!"
echo "Next, setup your terminal by running the following:"
echo "fisher install IlanCosman/tide@v5"