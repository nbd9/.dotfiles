source ~/.dotfiles/.exports
source ~/.dotfiles/fish/iterm2.fish

# Alias all files
for f in ~/.dotfiles/.aliases.*
    source $f
end

starship init fish | source

rvm default
eval conda "shell.fish" "hook" $argv | source

function fish_greeting
    fortune | cowsay | lolcat
end