# Setup brew
/opt/homebrew/bin/brew shellenv | source

# Setup mise
/opt/homebrew/bin/mise activate fish | source

# Setup iTerm
source $HOME/.iterm2_shell_integration.fish

# Source all exports
for f in ~/.dotfiles/.exports.*
    source $f
end

# Source all aliases
for f in ~/.dotfiles/.aliases.*
    source $f
end

function fish_greeting
    fortune | cowsay | lolcat
end
