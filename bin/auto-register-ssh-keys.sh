#!/bin/sh
# .ssh 以下の秘密鍵を探して ssh-agent に自動で順番に登録するスクリプト
# version 1.0.0

# 鍵種別リスト
# 自動登録させたい鍵はすべて、鍵のタイプで終わるような名前にすること。
keyTypes=('rsa' 'ecdsa' 'ed25519')

# .ssh ディレクトリのパス
DIR=$HOME/.ssh

for key in ${keyTypes[@]}; do
    for file in `find $DIR -name "*_$key"`; do
        ssh-add $file > /dev/null 2>&1
    done
done
