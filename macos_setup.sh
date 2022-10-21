echo "Sym-Linking Fish Files"
mkdir "$HOME/.config"
ln -sF "$HOME/.dotfiles/fish" "$HOME/.config"

echo "Sym-Linking Git Files"
ln -sF "$HOME/.dotfiles/.gitconfig" "$HOME"

# Install Brew
echo "Installing Brew"
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Brew CLI Programs
echo "Installing Brew Programs"
brew bundle

# Make Fish default shell
echo "Setting Fish shell to default"
sudo sh -c 'echo /usr/local/bin/fish >> /etc/shells'
chsh -s /usr/local/bin/fish

echo "Linking and Installing asdf tools"
ln -sF "$HOME/.dotfiles/.tool-versions" "$HOME"
ln -sF "$HOME/.dotfiles/.asdfrc" "$HOME"
while IFS=" " read -r plugin version
do
  asdf plugin-add "$plugin"
done < "$HOME/.dotfiles/.tool-versions"
asdf install

# Set up terminal
echo "Setting up Terminal"
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$HOME/.dotfiles/iTerm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

echo "Done!"
echo "Next, restart your terminal and configure fish shell:"
echo "curl -sL https://git.io/fisher | source"
echo "fisher install jorgebucaran/fisher"
echo "fisher install jethrokuan/z"
echo "fisher install IlanCosman/tide@v5"