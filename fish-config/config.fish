# brazil aliases
alias bb='brazil-build'
alias bbc='bb clean'
alias bba='bb apollo-pkg'
alias bbr='bb release'
alias bbra='bbr && bba'
alias bre='brazil-runtime-exec'
alias bws='brazil ws'
alias bwsuse='bws use --gitMode -p'
alias bwscreate='bws create -n'
alias brc='brazil-recursive-cmd'
alias brbb='brc brazil-build'
alias bball='brc --allPackages'
alias bbb='brc --allPackages brazil-build'

alias vim="/usr/local/nvim/bin/nvim"

# Default Editor
set -x EDITOR /usr/local/nvim/bin/nvim

# For solving git signing issue
set -x GPG_TTY (tty)

# PhantomJS for AirWolf
set -x PHANTOMJS_BINARY "/usr/local/bin/phantomjs"
set -x PHANTOMJS_BIN "/usr/local/bin/phantomjs"

###### ---- PATHS  ----
set -x PATH $PATH $HOME/bin /usr/bin /usr/local/bin /usr/local/sbin
set -x PATH $PATH /usr/local/opt/python/libexec/bin

# BuilderToolbox 
set -x PATH $PATH $HOME/.toolbox/bin

# Cloud Developer Kit
set -x PATH $PATH $HOME/.cdk/bin

# KubeCtl - Kubernetes Cluster manager
set -x PATH $PATH $HOME/.kubectl

# Go
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

# Rust
set -x PATH $PATH $HOME/.cargo/bin

# Java
set -x JAVA_HOME (/usr/libexec/java_home -v 1.8)

# NVM (using nvm with fish: https://eshlox.net/2019/01/27/how-to-use-nvm-with-fish-shell)
set -x NVM_DIR $HOME/.nvm

# iterm2 shell integration
test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
