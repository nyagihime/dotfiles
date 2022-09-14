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

# ----- プロジェクトショートカット
# i = InfoLounge
# j = jukebox web service
# a = jukebox arduino
# p = jukebox raspberry pi
alias i='cd ~/InfoLounge/projects'
alias j='cd ~/ju9box/workspace'
alias a='cd ~/ju9box/ws-arduino'
alias p='cd ~/ju9box/ws-raspberry'

# ----- Git
function g() {
    echo "git shortcuts
gb:     show branch
        = git branch
gnb:    create new branch
        = git checkout -b
gbname: rename branch
        = git branch -m
gs:     switch branch
        = git switch
gst:    show status
        = git status
"
}
alias gb='git branch'
alias gnb='git checkout -b'
alias gbname='git branch -m'
alias gs='git switch'
alias gst='git status'
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
