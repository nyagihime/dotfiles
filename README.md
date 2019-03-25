# dotfiles

黒い画面の環境をまとめて管理するためのリポジトリ

## install

```shell
git clone git@gitlab.ju9box.net:nyagihime/dotfiles.git ~/dotfiles
cd ~/dotfiles
ln -s $(pwd)/zsh/zshrc ~/.zshrc
ln -s $(pwd)/tmux/tmux.conf ~/.tmux.conf
ln -s $(pwd)/dotvim/ ~/.vim
ln -s $(pwd)/vimrc ~/.vimrc

...
```

Vim プラグインインストール

vim 起動 → `:PlugInstall`

## TODO

- [ ] Install script (ex; setup.sh or Makefile)
- [ ] support .gitconfig
- [ ] support .bashrc
- [x] support .vimrc
- [ ] インストール時の `ln -s` 祭りを自動化する
- [x] セッション閉じたときも番号を詰められるか調べる
