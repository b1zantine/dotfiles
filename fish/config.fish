source ~/dotfiles/aliases.sh

# On Apple silicon mac
if [ (uname -m) = 'arm64' ]
    alias vim="/opt/homebrew/bin/nvim"
    set -x EDITOR /opt/homebrew/bin/nvim

else  # On Intel mac
    alias vim="/usr/local/bin/nvim"
    set -x EDITOR /usr/local/bin/nvim
end

set -x LC_ALL en_US.UTF-8

# For solving git signing issue
set -x GPG_TTY (tty)

###### ---- PATHS  ----
set -x PATH $PATH /usr/bin /usr/local/bin /usr/local/sbin /opt/homebrew/bin

# Rancher Desktop
set -x PATH $PATH ~/.rd/bin

# KubeCtl - Kubernetes Cluster manager
set -x PATH $PATH $HOME/.kubectl

# Go
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

# Rust
set -x PATH $PATH $HOME/.cargo/bin

# Java
set -x JAVA_HOME (/usr/libexec/java_home -v 17)

# NVM (using nvm with fish: https://eshlox.net/2019/01/27/how-to-use-nvm-with-fish-shell)
set -x NVM_DIR $HOME/.nvm

# iterm2 shell integration
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
