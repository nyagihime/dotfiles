# ------------------------------------------------
# anyenv
# ------------------------------------------------
# anyenv 及び xxenv 系の設定はここ
# 遅延ロードさせているので、xxenv 追加したら
# 下の方にある xxenv ラッパーも追記すること
# ------------------------------------------------

export ANYENV_ROOT=$HOME/.anyenv

if [ -d $ANYENV_ROOT ]; then
	export PATH="$HOME/.anyenv/bin:$PATH"
  for D in `command ls $ANYENV_ROOT/envs`
  do
    export PATH="$ANYENV_ROOT/envs/$D/shims:$PATH"
  done
fi

# node path
export NODE_PATH="$HOME/.anyenv/envs/ndenv/shims"

# anyenv が重いので、自動 rehash なしで起動させる
function anyenv_init() {
  	eval "$(anyenv init - --no-rehash)"
}

# すべての xxenv をアンロード
function anyenv_unset() {
  for D in `command ls $ANYENV_ROOT/envs`
  do
    unset -f $D
  done
}

# xxenv ラッパー
# ------------------------------------------------
# anyenv とその仲間たちはなかなかに重いので
# 遅延ロードさせている
# ------------------------------------------------

# nodenv
function nodenv() {
  anyenv_unset
  anyenv_init
  nodenv "$@"
}

# phpenv
function phpenv() {
  anyenv_unset
  anyenv_init
  phpdenv "$@"
}

# pyenv
function pyenv() {
  anyenv_unset
  anyenv_init
  pydenv "$@"
}
