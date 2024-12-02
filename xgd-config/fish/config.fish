# vi mode
fish_vi_key_bindings

# Setup brew libraries
eval (/opt/homebrew/bin/brew shellenv fish)
source /opt/homebrew/share/fish/config.fish

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
