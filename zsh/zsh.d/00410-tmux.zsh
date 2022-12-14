# ------------------------------------------------
# tmux と、関連コマンド
# ------------------------------------------------
# tmux の設定、起動、補助コマンドの定義は
# ここに置く
# ------------------------------------------------

# tmux にパスを通す
export PATH="/usr/local/opt/ncurses/bin:$PATH"

# tmux （with fzf）起動
# Hyper を立ち上げたときだけ起動するように変更
#（VSCodeやIntelliJでは普通のターミナルにしたい）
# @see https://qiita.com/ssh0/items/a9956a74bff8254a606a
# @see https://qiita.com/otyamura/items/27e673a80952924b30f8
if [[ ! -n $TMUX && $TERM_PROGRAM == 'Hyper' ]]; then
  $DOTFILES/bin/bootmux
fi

# tmux 経由でタイトルを更新できるようにする
# ------------------------------------------------
# Override auto-title when static titles are desired ($ title My new title)
title() { export TITLE_OVERRIDDEN=1; echo -en "\e]0;$*\a"}
# Turn off static titles ($ autotitle)
autotitle() { export TITLE_OVERRIDDEN=0 }; autotitle
# Condition checking if title is overridden
overridden() { [[ $TITLE_OVERRIDDEN == 1 ]]; }
# Echo asterisk if git state is dirty
gitDirty() { [[ $(git status 2> /dev/null | grep -o '\w\+' | tail -n1) != ("clean"|"") ]] && echo "*" }

# Show cwd when shell prompts for input.
precmd() {
   if overridden; then return; fi
   cwd=${$(pwd)##*/} # Extract current working dir only
   print -Pn "\e]0;$cwd$(gitDirty)\a" # Replace with $pwd to show full path
}

# Prepend command (w/o arguments) to cwd while waiting for command to complete.
preexec() {
   if overridden; then return; fi
   printf "\033]0;%s\a" "${1%% *} | $cwd$(gitDirty)" # Omit construct from $1 to show args
}
# ---------------------------------------------
