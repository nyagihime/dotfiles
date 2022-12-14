# dotfiles

黒い画面の環境をまとめて管理するためのリポジトリ

## with Symbol Fonts

- Version2より、アイコンフォントを使用するように変更。
- SF Mono Square に最適化して設定ファイルをすべて書き直し。

よって、tmux を起動するターミナルはフォントに SF Mono Square をインストールしておく必要あり。
また同時に、設定を編集するエディタも SF Mono Square をインストールしておく必要あり。

### フォントテスト

エディタでこの README.md を開いて次の行を確認。
 ←が見えていればOK。

### フォントインストールと、Glyphの確認

[delphinus/homebrew-sfmono-square](https://github.com/delphinus/homebrew-sfmono-square)
アイコンフォントは NerdFont ベースなので、ここで探すのが良い
[Cheat Sheet](https://www.nerdfonts.com/cheat-sheet)

もととなったフォントの略称がクラス名にはいっているっぽいので、それをもとにある程度当たりをつけられる。
たとえば、PowerLine 系のシンボルなら `nf-ple` といれると多分見つかる（PLE：PowerLine Extra symbols）

## 対応リスト

- tmux
- zsh
- vim
- Alacritty
- Hyper

## install

> 既に ~/.zshrc や ~/.tmux.conf などがある場合はリンクを貼る前に削除しておくこと

```shell
git clone git@github.com:nyagihime/dotfiles.git ~/dotfiles
cd ~/dotfiles
git clone https://github.com/tmux-plugins/tpm tmux/plugins/tpm
ln -s $(pwd)/zsh/zshrc ~/.zshrc
ln -s $(pwd)/zsh/zlogin ~/.zlogin
ln -s $(pwd)/zsh/zlogout ~/.zlogout
ln -s $(pwd)/tmux/tmux.conf ~/.tmux.conf
ln -s $(pwd)/vim/dotvim/ ~/.vim
ln -s $(pwd)/vim/vimrc ~/.vimrc
ln -s $(pwd)/alacritty ~/.config/alacritty/alacritty.yaml
ln -s $(pwd)/hyper/hyper.js ~/.hyper.js
ln -s $(pwd)/hyper/hyper_plugins ~/.hyper_plugins
ln -s $(pwd)/bin/git-create /usr/local/bin/git-create
ln -s $(pwd)/bin/git-delete-merged-branch /usr/local/bin/git-delete-merged-branch
git config --global commit.template $(pwd)/git/commit_template
git config --global core.excludesfile $(pwd)/git/gitignore_global
...
```

Vim プラグインインストール

vim 起動 → `:PlugInstall`

## Zinit

zsh のプラグイン管理は [Zinit](https://github.com/zdharma/zinit) に変更した。
自動インストールでも良いが、.zshrcの書き換えとかもあるので手動でやっている。

### インストール

```zsh
cd
mkdir .zinit
git clone https://github.com/zdharma/zinit.git ~/.zinit/bin
```

### 有効化

> compinit 関連より前に書く。下に書く場合は、ドキュメントのインストール手順に従う。

```zshrc
source $HOME/.zinit/bin/zinit.zsh
```

次からは自動インストールを使っても良い気がしてきた。

とりあえずインストールしているプラグインをここに挙げておく。

> zsh-users/zsh-completions を使う場合は、`zplugin ice blockf` しておくと動作が高速になるらしい
> @see [https://blog.katio.net/page/zplugin](https://blog.katio.net/page/zplugin)

- zsh-users/zsh-completions
- zsh-users/zsh-autosuggestions
- zdharma/fast-syntax-highlighting
- g-plane/zsh-yarn-autocompletions

プラグインのインストール方法 `zinit light ${plugin-name}`
使わなくなったら `zinit unload ${plugin-name}`

zplug のプラグインとかもこれでインストールできる

```zsh
zinit light zsh-users/zsh-autosuggestions
```

Zinit 自体のアップデート

```bash
zinit self-update
```

## ssh-agent 自動登録

`bin/auto-register-ssh-keys.sh` は、
`~/.ssh` 配下の、末尾が`_rsa` `_ecdsa` `_ed25519` のファイルに対して
自動的に agent への登録を試みます。

~~パスフレーズ付きの鍵を登録する場合は、`bin/ssh-agent-pass-phrase-manager.sh` を実行します~~
とりあえず手で頑張る。

## TODO

- [ ] Install script (ex; setup.sh or Makefile)
- [ ] インストール時の `ln -s` 祭りを自動化する
- [ ] support .gitconfig
- [ ] support .bashrc
- [x] support .vimrc
- [x] セッション閉じたときも番号を詰められるか調べる
- [ ] zshrc のうち、aws cli とか gcloud cli とかの設定まわりは別ファイルに分けたい
- [ ] 使ってないターミナルエミュレータの設定は捨てて少し整理する
- [x] GitHubに引っ越す