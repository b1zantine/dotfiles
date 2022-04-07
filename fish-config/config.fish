# git aliases
alias gst="git status"
alias gcb="git checkout -b"
alias gl="git log --oneline"
alias gaa="git add -A"
alias gpom="git push origin mainline"
alias gcm="git commit -m"

alias dot="cd ~/dotfiles/ && nvim"
alias code="cd ~/Code/"
alias vim="/usr/local/bin/nvim"

# Default Editor
set -x EDITOR /usr/local/bin/nvim

set -x LC_ALL en_US.UTF-8

# For solving git signing issue
set -x GPG_TTY (tty)

###### ---- PATHS  ----
set -x PATH $PATH $HOME/bin /usr/bin /usr/local/bin /usr/local/sbin

# KubeCtl - Kubernetes Cluster manager
set -x PATH $PATH $HOME/.kubectl

# Go
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

# Rust
set -x PATH $PATH $HOME/.cargo/bin

# Java
set -x JAVA_HOME (/usr/libexec/java_home -v 11)

# NVM (using nvm with fish: https://eshlox.net/2019/01/27/how-to-use-nvm-with-fish-shell)
set -x NVM_DIR $HOME/.nvm

# iterm2 shell integration
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
