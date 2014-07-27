source $HOME/dotfiles/zsh.d/zshrc
#source ~/dotfiles/zsh.d/config/packages.zsh

#source zaw.zsh
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 5000
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both
source $HOME/dotfiles/zaw/zaw.zsh
# 絞り込みをcase-insensitiveに
zstyle ':filter-select' case-insensitive yes
# zaw-cdrをbindkey
bindkey '^@' zaw-cdr

# nodebrew setting
export PATH=$HOME/.nodebrew/current/bin:$PATH

# vim setting
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

# go setting
source $HOME/dotfiles/zsh/.zshrc.go

# peco search
source $HOME/dotfiles/zsh/.zshrc.peco.zsh

# other .zsh files
source $HOME/dotfiles/zsh/.zshrc.alias
source $HOME/dotfiles/zsh/.zshrc.functions

# source phpbrew
source $HOME/.phpbrew/bashrc

# hub
eval "$(hub alias -s)"
eval "$(rbenv init -)"


fpath=(/usr/local/share/zsh-completions $fpath)

export TERM=xterm-256color
