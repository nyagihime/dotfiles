# ------------------------------------------------
# 基本設定
# ------------------------------------------------
# 真っ先に読み込まれる基本設定系はここ
# ------------------------------------------------

# ------------------------------------------------
# .zshrc のコンパイル設定
# ------------------------------------------------
# .zshrc に変更があればまた自動コンパイル
# 不要な環境もあるので、初回は自分で zcompile する
if [ $DOTFILES/zsh/zshrc -nt $DOTFILES/zsh/zshrc.zwc ]; then
  zcompile $DOTFILES/zsh/zshrc
fi

# Language (一部のターミナルエミュが日本語を出せない問題対策)
export LANG=ja_JP.UTF-8
export LC_TYPE=ja_JP.UTF-8

# ロケール設定
# LANGで基本設定を ja_JP に変更した上で英語表記にしておきたい部分を en_US で上書き
# @see https://qiita.com/aosho235/items/58e2e7acd5c2ee3641ff
# @see https://wiki.archlinux.jp/index.php/%E3%83%AD%E3%82%B1%E3%83%BC%E3%83%AB
export LC_MESSAGES=en_US.UTF-8
export LC_TIME=en_US.UTF-8

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

# 重複パスを登録しない
typeset -U path cdpath fpath manpath

# nyae? 有効化
setopt correct

# history関連
# ------------------------------------------------
# 履歴ファイルの保存先
export HISTFILE=${HOME}/.zsh_history

# メモリに保存される履歴の件数
export HISTSIZE=10000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000

# 重複を記録しない
setopt hist_ignore_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY
