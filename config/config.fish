alias pbcopy "xclip -selection clipboard"
alias pbpaste "xclip -selection clipboard -o"

set fishlocation "~/.config/fish/config.fish"
alias fish-location "$fishlocation"
alias fish-reload "source $fishlocation"
alias fish-edit "nvim $fishlocation"

alias chrome "google-chrome-stable"

alias default-chrome "sed -i -e 's/$firefoxname/$chromename/g' $mimemappslocation"
alias default-firefox "sed -i -e 's/$chromename/$firefoxname/g' $mimemappslocation"

alias ssh-flavio "ssh guilherme@200.20.164.152"

alias nixos-edit "sudoedit /etc/nixos/configuration.nix"

alias config 'git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
