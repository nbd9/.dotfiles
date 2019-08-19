# Path to your oh-my-zsh installation.
export ZSH="/Users/nbdeg/.oh-my-zsh"
ZSH_THEME="spaceship"

SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_12HR=true
SPACESHIP_PROMPT_ORDER=(
  dir           # Current directory section
  time          # Time stamps section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  xcode         # Xcode section
  swift         # Swift section
  docker        # Docker section
  aws           # Amazon Web Services section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  terraform     # Terraform workspace section
  exec_time     # Execution time
  line_sep      # Line break
  battery       # Battery level and status
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)


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
