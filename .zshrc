source ~/dotfiles/zsh.d/zshrc
#source ~/dotfiles/zsh.d/config/packages.zsh

#source zaw.zsh
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 5000
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both
source ~/dotfiles/zaw/zaw.zsh
# 絞り込みをcase-insensitiveに
zstyle ':filter-select' case-insensitive yes
# zaw-cdrをbindkey
bindkey '^@' zaw-cdr

# nodebrew setting
export PATH=~/.nodebrew/current/bin:/bin:/usr/local/bin:/usr/bin

# vim setting
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

# go setting
fpath=(/usr/local/share/zsh-completions /usr/local/share/zsh/site-functions /usr/local/Cellar/zsh/5.0.5/share/zsh/functions /Users/ryo/dotfiles/zaw/functions)
export PATH=/Users/ryo/.nodebrew/current/bin:/bin:/usr/local/bin:/usr/bin:/usr/local/opt/go/libexec/bin
export GOPATH=/Users/ryo/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin

# peco search
source ~/dotfiles/.zshrc.peco.zsh

# source phpbrew
source ~/.phpbrew/bashrc
