# Install Brew
echo "Installing Brew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install Brew CLI Programs
echo "Installing Brew Programs"
brew bundle

# Git Shots Dir
mkdir "$HOME/.gitshots"

# Yarn global packages
echo "Installing Yarn Global Programs"
yarn global add firebase-tools standard

# VSCode Settings Sync Extension
echo "Installing VS Code Settings"
mkdir -p "$HOME/Library/Application\ Support/Code/User"
ln -sF "$HOME/.dotfiles/VSCode/keybindings.json" "$HOME/Library/Application\ Support/Code/User/keybindings.json"
ln -sF "$HOME/.dotfiles/VSCode/settings.json" "$HOME/Library/Application\ Support/Code/User/settings.json"
code --install-extension 2gua.rainbow-brackets
code --install-extension chenxsan.vscode-standardjs
code --install-extension christian-kohler.path-intellisense
code --install-extension deerawan.vscode-faker
code --install-extension eamodio.gitlens
code --install-extension EditorConfig.EditorConfig
code --install-extension Equinusocio.vsc-material-theme
code --install-extension formulahendry.auto-close-tag
code --install-extension formulahendry.auto-complete-tag
code --install-extension formulahendry.auto-rename-tag
code --install-extension GitHub.vscode-pull-request-github
code --install-extension James-Yu.latex-workshop
code --install-extension michelemelluso.gitignore
code --install-extension ms-python.python
code --install-extension ms-vscode.node-debug2
code --install-extension msjsdiag.debugger-for-chrome
code --install-extension msjsdiag.vscode-react-native
code --install-extension Orta.vscode-ios-common-files
code --install-extension PKief.material-icon-theme
code --install-extension pnp.polacode
code --install-extension redhat.vscode-xml
code --install-extension rubbersheep.gi
code --install-extension shyykoserhiy.vscode-spotify
code --install-extension WakaTime.vscode-wakatime
code --install-extension yzhang.markdown-all-in-one
code --install-extension zxh404.vscode-proto3

# Set up terminal
echo "Setting up Terminal"
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "$HOME/.dotfiles/iTerm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# Key Repeat Fix
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1

# Temp headless fix to install without stopping script execution.
0>/dev/null "$(curl -fsSL https://raw.githubusercontent.com/leoj3n/oh-my-zsh/leoj3n-oh-my-install/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -sF "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

echo "Sym-Linking zshrc and git files"
ln -sF "$HOME/.dotfiles/.zshrc" ~
ln -sF "$HOME/.dotfiles/.gitconfig" ~

echo "Done! You're good to go."
