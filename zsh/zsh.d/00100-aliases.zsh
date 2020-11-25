# ------------------------------------------------
# エイリアス登録
# ------------------------------------------------
# カスタムコマンドやエイリアスはこのファイルに
# 記述する
# ------------------------------------------------

# ----- 表示系
alias ll='ls -la'
alias ls='ls -G'
alias cl='clear'
alias .r='source ~/.zshrc'

# ----- 移動系
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'

# ----- その他
alias bootmux='$DOTFILES/bin/bootmux'

alias docker-kill-all='docker kill $(docker ps -q)'
alias todo='$DOTFILES/bin/todoclist'
alias dotfiles='$DOTFILES'
alias reload-shell='exec $SHELL -l'
alias ndenv='nodenv'

# カスタム関数登録
function tabname {
    echo -ne "\033]0;"$*"\007"
}
