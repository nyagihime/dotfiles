# ------------------------------------------------
# Zplug 改め Zinit の設定
# ------------------------------------------------
# プラグインの読み込み設定などはここで行う
# ------------------------------------------------

# zplug 有効化
# export ZPLUG_HOME=/usr/local/opt/zplug
# source $ZPLUG_HOME/init.zsh

# ------------------------------------------------
# Zinit (zplug の代わり)
# ------------------------------------------------
source $HOME/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# プラグインの有効化（個々に記述して設定ファイルをリロードすると自動的にインストールされる）
# 削除したい場合は zinit delete <plugin name>
zinit light zsh-users/zsh-completions                   # オートコンプリート
zinit light zsh-users/zsh-autosuggestions               # コマンドサジェスト
zinit light zdharma-continuum/fast-syntax-highlighting  # コマンドシンタックスハイライト
zinit light g-plane/zsh-yarn-autocompletions            # yarn 補完
# 自作のフックとバッティングするのでやめた
# zinit light MichaelAquilina/zsh-autoswitch-virtualenv   # python の仮想環境に入ると自動で activate
