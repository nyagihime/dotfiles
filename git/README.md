# Git 関連

git ディレクトリには、Git関連の設定などを収録しています

## global.gitignore

システム全体で登録するグローバルな .gitignore 集。
以下のように Git config に登録して使用する

```zsh
git config --global core.excludesfile $DOTFILES/git/gitignore_global
```

## commit_template

commit_template は、`-m` オプション無しでコミットしたときにエディタにデフォルトで
入力されるコミットメッセージのテンプレートです。
コミット時のルールやよく使う定型文、semantic-pull-request で使う接頭辞などをコメント行にしておいて
カンペに使うといったことができます。

```zsh
git config --global commit.template $DOTFILES/git/commit_template
```

## git-create

アカウントを選んでローカル git config に設定しリポジトリを初期化するシェルスクリプトです。
（このスクリプトはステージングファイル０のまま初期コミットを行います）

sh で実行するか、実行権限を与えた上で alias にして使います。
