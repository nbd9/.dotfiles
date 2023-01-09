# Setup brew
eval (/opt/homebrew/bin/brew shellenv)

# Setup ASDF
source /opt/homebrew/opt/asdf/libexec/asdf.fish

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
