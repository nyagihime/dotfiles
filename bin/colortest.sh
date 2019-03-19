#!/bin/sh

# tmux で使える色コード名の確認
# @see https://superuser.com/questions/285381/how-does-the-tmux-color-palette-work
for i in {0..255};
do printf "\x1b[38;5;${i}mcolor%-5i\x1b[0m" $i ;
    if ! (( ($i + 1 ) % 8 )); then
        echo ;
    fi ;
done
