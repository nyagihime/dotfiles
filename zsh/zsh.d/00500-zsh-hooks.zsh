# ------------------------------------------------
# Zsh カスタムフック
# ------------------------------------------------
# Zsh 用のカスタムフックはここ
# ------------------------------------------------

# python の virtual env 環境に入ったら自動で activate する（環境名が .venv のときのみ）
# ※ zsh プラグインの zsh-autoswitch-virtualenv と相性が悪いため、そっちは削除すること
# https://dev.to/moniquelive/auto-activate-and-deactivate-python-venv-using-zsh-4dlm
python_venv_auto_activation () {
    VENV_DIR=.venv
    [[ -d $VENV_DIR ]] && . $VENV_DIR/bin/activate > /dev/null 2>&1
    [[ ! -d $VENV_DIR ]] && deactivate > /dev/null 2>&1
}

# -U: 展開される関数内で alias の展開をしないようにする
# -z: zsh形式で読み込む
autoload -Uz add-zsh-hook
add-zsh-hook chpwd python_venv_auto_activation

python_venv_auto_activation