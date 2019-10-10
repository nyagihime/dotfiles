# dotfiles

黒い画面の環境をまとめて管理するためのリポジトリ

## 対応リスト

- tmux
- zsh
- vim
- Alacritty

## install

> 既に ~/.zshrc や ~/.tmux.conf などがある場合はリンクを貼る前に削除しておくこと

```shell
git clone git@gitlab.ju9box.net:nyagihime/dotfiles.git ~/dotfiles
cd ~/dotfiles
git clone https://github.com/tmux-plugins/tpm tmux/plugins/tpm
ln -s $(pwd)/zsh/zshrc ~/.zshrc
ln -s $(pwd)/tmux/tmux.conf ~/.tmux.conf
ln -s $(pwd)/dotvim/ ~/.vim
ln -s $(pwd)/vimrc ~/.vimrc
ln -s $(pwd)/alacritty ~/.config/alacritty/alacritty.yaml
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
