# Path to your oh-my-zsh installation.
export ZSH="/Users/nbdeg/.oh-my-zsh"
ZSH_THEME="spaceship"

plugins=(
  git-flow
  zsh-autosuggestions
  yarn
  pip
  python
  sudo
  vscode
)

source $ZSH/oh-my-zsh.sh
source ~/.dotfiles/.exports
for f in ~/.dotfiles/.aliases.*; do source $f; done
eval $(thefuck --alias)
eval "$(pyenv init -)"

fortune | cowsay | lolcat
