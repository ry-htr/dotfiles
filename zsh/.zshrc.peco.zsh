function peco-select-history() {
    local tac
    if which tac > /dev/null; then
    tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history

#Ctrl-rで検索開始
bindkey '^r' peco-select-history

# ディレクトリ移動
function peco-cdr () {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-cdr
bindkey '^[p' peco-cdr


# ghq
p() {
    peco | while read LINE; do $@ $LINE; done
}
alias e='ghq list -p | p cd'

# agで絞ってvimで開く
function ptvim () {
  vim $(pt $@ | peco --query "$LBUFFER" | awk -F : '{print "-c " $2 " " $1}')
}
