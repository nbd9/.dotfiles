source ~/.dotfiles/.exports

# Alias all files
for f in ~/.dotfiles/.aliases.*
    source $f
end

starship init fish | source

function fish_greeting
    fortune | cowsay | lolcat
end