#!/bin/sh
#
# 256色のカラーパレットを表示する
#  bash と zsh にて実行可能
#  @see https://github.com/yonchu/shell-color-pallet
#

# プロンプトの色は、$F{} で文字色、$K{} で背景色を指定。引数は、カラーコード（番号）か、色名（green 等）

target_shell=$1

if [ -z "$1" ]; then
    target_shell=$(basename "$SHELL")
fi

if [ "$target_shell" = "bash" ]; then
    bash <<< 'for code in {0..255}; do echo -n "[38;05;${code}m $(printf %03d $code)"; [ $((${code} % 16)) -eq 15 ] && echo; done'
elif [ "$target_shell" = "zsh" ]; then
    zsh  <<< 'for code in {000..255}; do print -nP -- "%F{$code}$code %f"; [ $((${code} % 16)) -eq 15 ] && echo; done'
else
    echo "error: Invalid argument ($target)"
    echo "Usage: $0 [bash|zsh]"
fi
