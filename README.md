# dotfiles

黒い画面の環境をまとめて管理するためのリポジトリ

> アイコンフォントを使ってるので、Cica をインストールし、ターミナルのフォントとして指定しておく事！
> また、各 dotfiles を編集する場合も Cica をインストールした環境で行わないとグリフが見えません。

 ←が見えていればOK。豆腐になる場合はインストールされていません。

[miiton/Cica](https://github.com/miiton/Cica)
[Cicaに含まれるPUAのグリフ一覧](https://miiton.github.io/Cica/)

## 対応リスト

- tmux
- zsh
- vim
- Alacritty
- Hyper

## install

> 既に ~/.zshrc や ~/.tmux.conf などがある場合はリンクを貼る前に削除しておくこと

```shell
git clone git@gitlab.ju9box.net:nyagihime/dotfiles.git ~/dotfiles
cd ~/dotfiles
git clone https://github.com/tmux-plugins/tpm tmux/plugins/tpm
ln -s $(pwd)/zsh/zshrc ~/.zshrc
ln -s $(pwd)/tmux/tmux.conf ~/.tmux.conf
ln -s $(pwd)/vim/dotvim/ ~/.vim
ln -s $(pwd)/vim/vimrc ~/.vimrc
ln -s $(pwd)/alacritty ~/.config/alacritty/alacritty.yaml
ln -s $(pwd)/hyper/hyper.js ~/.hyper.js
ln -s $(pwd)/hyper/hyper_plugins ~/.hyper_plugins
git config --global commit.template $(pwd)/git/commit_template

...
```

Vim プラグインインストール

vim 起動 → `:PlugInstall`

## TODO

- [ ] Install script (ex; setup.sh or Makefile)
- [ ] インストール時の `ln -s` 祭りを自動化する
- [ ] support .gitconfig
- [ ] support .bashrc
- [x] support .vimrc
- [x] セッション閉じたときも番号を詰められるか調べる
- [ ] zshrc のうち、aws cli とか gcloud cli とかの設定まわりは別ファイルに分けたい
- [ ] ツールバーなどをアイコンフォントを使ってすっきりさせる
