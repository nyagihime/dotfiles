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
