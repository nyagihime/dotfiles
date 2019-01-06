# dotfiles

黒い画面の環境をまとめて管理するためのリポジトリ

## install

```shell
git clone git@gitlab.ju9box.net:nyagihime/dotfiles.git ~/dotfiles
cd ~/dotfiles
ln -s $(pwd)/zsh/zshrc ~/.zshrc
ln -s $(pwd)/tmux/tmux.conf ~/.tmux.conf
...
```

## TODO

- [ ] Install script (ex; setup.sh or Makefile)
- [ ] support .gitconfig
- [ ] support .bashrc
- [ ] support .vimrc
- [ ] セッション閉じたときも番号を詰められるか調べる