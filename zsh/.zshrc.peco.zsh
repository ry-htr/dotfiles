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
bindkey '^@' peco-cdr


# ghq
alias e='ghq list -p | p cd'
alias gh='gh-open $(ghq list -p | peco)'


# agで絞ってvimで開く
function ptvim () {
  vim $(pt $@ | peco --query "$LBUFFER" | awk -F : '{print "-c " $2 " " $1}')
}

function peco-dfind() {
    local current_buffer=$BUFFER
    # .git系など不可視フォルダは除外
    local selected_dir="$(find . -maxdepth 5 -type d ! -path "*/.*"| peco)"
    if [ -d "$selected_dir" ]; then
        BUFFER="${current_buffer} \"${selected_dir}\""
        CURSOR=$#BUFFER
        # ↓決定時にそのまま実行するなら
        #zle accept-line
    fi
    zle clear-screen
}
zle -N peco-dfind
bindkey '^x^f' peco-dfind
