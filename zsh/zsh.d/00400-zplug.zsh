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

# プラグインの有効化
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
zinit light g-plane/zsh-yarn-autocompletions
