# Install Brew
echo "Installing xcode Command Line Tools"
xcode-select --install

echo "Cloning Repo"
git clone https://github.com/nbd9/dotfiles ~/.dotfiles

echo "Installing Brew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Brew CLI Programs
echo "Installing Brew CLI Programs"
brew install cowsay
brew install fortune
brew install lolcat

brew install n
brew install pyenv
brew install pipenv
brew install yarn

brew install zsh
brew install thefuck
brew install git-flow
brew install mas

# Install Brew Cask Programs
echo "Installing Brew Cask Programs"
brew cask install font-hack
brew cask install google-chrome
brew cask install iterm2
brew cask install private-internet-access
brew cask install sketch
brew cask install spotify
brew cask install visual-studio-code
brew cask install slack

# Yarn global packages
echo "Installing Yarn Global Programs"
yarn global add firebase-tools standard

# Set up terminal
echo "Installing oh-my-zsh and Spaceship Prompt"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

# Install macOS App Store Programs
echo "Installing macOS App Store Programs"
mas install 937984704 # Amphetamine
mas install 441258766 # Magnet

# VSCode Settings Sync Extension
echo "Installing VSCode Settings Sync"
code --install-extention Shan.code-settings-sync

echo "Changing Various Annoyances"
# Disable remote apple events
sudo systemsetup -setremoteappleevents off
# Disable remote login
sudo systemsetup -setremotelogin off
# Disable wake-on modem
sudo systemsetup -setwakeonmodem off
# Disable wake-on LAN
sudo systemsetup -setwakeonnetworkaccess off
# Disable guest account login
sudo defaults write /Library/Preferences/com.apple.loginwindow GuestEnabled -bool false
sudo tmutil disablelocal;ok
# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false
# Good scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false;ok
# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0;ok
# Show hidden files by default
defaults write com.apple.finder AppleShowAllFiles -bool true;ok
# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true;ok
# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true;ok
# Show path bar
defaults write com.apple.finder ShowPathbar -bool true;ok
# Bottom right screen corner → Show desktop
defaults write com.apple.dock wvous-br-corner -int 4
defaults write com.apple.dock wvous-br-modifier -int 0;ok

echo "Sym-Linking zshrc and git files"
ln -sf "~/.dotfiles/.zshrc" ~
ln -sf "~/.dotfiles/.gitconfig" ~
ln -sf "~/.dotfiles/.gitignore" ~

echo "Done! You're good to go."
