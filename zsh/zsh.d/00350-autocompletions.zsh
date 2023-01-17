# ------------------------------------------------
# 入力補完関連
# ------------------------------------------------
# 補完候補をカーソルで選択できるようにする
# ※ compinit は起動プロセスの中で１回呼べばOK。プラグインとかで呼んでたりするならここではスルーできる
# ※なぜか有効にならなくなったからやっぱり呼ぶように変更
autoload -U compinit
compinit -u
zstyle ':completion:*:default' menu select=1

# tab 補完で大文字小文字を区別しない
zstyle ':completion:' matcher-list 'm:{a-z}={A-Z}'

# わざわざ大文字を入力した時は小文字の候補を補完しない
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

# でもやっぱり大文字の候補が見つからない場合には, 小文字の候補を補完する
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'

# fzf 設定のロード
# todo これも dotfiles 配下に移動したい
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# caniuse-cli の Tab補完に対応
# @see https://www.npmjs.com/package/caniuse-cli
# . <(caniuse --completion)
