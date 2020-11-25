# ------------------------------------------------
# プロンプト
# ------------------------------------------------
# プロンプトのデザイン関連はここ
# ------------------------------------------------

# （左）
# PROMPT="%F{036}[%n@%m]%{$reset_color%} @ %{${fg[blue]}%}[%(3~,%-1~/.../%1~,%~)]%{${reset_color}%}"
# PROMPT="%F{yellow}(ﾉ-_-)ﾉ ~┻━┻･..｡;･'%{$reset_color%} @ %{${fg[cyan]}%}[%(3~,%-1~/.../%1~,%~)]%{${reset_color}%}"
PROMPT="%F{034} : %(1~,%1~,%~)${reset_color}"

autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
# PROMPT=$PROMPT"${vcs_info_msg_0_}"

case ${USERNAME} in
'root')
PROMPT=$PROMPT"
%F{red}❯ ${reset_color}"
		;;
*)
PROMPT=$PROMPT"
%F{red}❯ ${reset_color}"
		;;
esac

# （右）今は使ってない
# RPROMPT=''


# ------------------------------------------------
# 入力補完関連
# ------------------------------------------------
# 補完候補をカーソルで選択できるようにする
# ※ compinit は起動プロセスの中で１回呼べばOK。プラグインとかで呼んでたりするならここではスルーできる
# autoload -U compinit
# compinit -u
zstyle ':completion:*:default' menu select=1

# tab 補完で大文字小文字を区別しない
zstyle ':completion:' matcher-list 'm:{a-z}={A-Z}'

# わざわざ大文字を入力した時は小文字の候補を補完しない
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

# でもやっぱり大文字の候補が見つからない場合には, 小文字の候補を補完する
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'

# fzf 設定のロード
# todo これも dotfiles 配下に移動したい
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# caniuse-cli の Tab補完に対応
# @see https://www.npmjs.com/package/caniuse-cli
. <(caniuse --completion)
