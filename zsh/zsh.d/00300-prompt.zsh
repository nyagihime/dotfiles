# ------------------------------------------------
# プロンプト
# ------------------------------------------------
# プロンプトのデザイン関連はここ
# ------------------------------------------------

# （左）
# PROMPT="%F{036}[%n@%m]%{$reset_color%} @ %{${fg[blue]}%}[%(3~,%-1~/.../%1~,%~)]%{${reset_color}%}"
# PROMPT="%F{yellow}(ﾉ-_-)ﾉ ~┻━┻･..｡;･'%{$reset_color%} @ %{${fg[cyan]}%}[%(3~,%-1~/.../%1~,%~)]%{${reset_color}%}"
# PROMPT="%F{034} : %(1~,%1~,%~)${reset_color}"

# VCS INFO関係
setopt prompt_subst
autoload -Uz add-zsh-hook
autoload -Uz vcs_info

zstyle ':vcs_info:git:*' check-for-changes true
# stagedstr の設定
# git add されてるけど commit されていないファイルがあると
# 表示されるメッセージのフォーマット
# formats に %c を書くと展開される
zstyle ':vcs_info:git:*' stagedstr "%F{yellow} "

# unstagedstr の設定
# 変更があったけど、 git add されていないファイルがあると
# 表示されるメッセージのフォーマット
# formats に %u を書くと展開される
zstyle ':vcs_info:git:*' unstagedstr "%F{red} "

# $vcs_info_msg_0_ の書式設定
zstyle ':vcs_info:*' formats "%F{026}[ %b]%c%u%f"

# コンフリクトやマージ中など、特殊な状況のときは
# formats の代わりにこちらが表示される。
# %a でアクション名が展開される（actionformats でのみ使える）
zstyle ':vcs_info:*' actionformats '(%a)[ %b]'

# precmd から呼ばれる関数
function _precmd_vcs_info () {
  LANG=en_US.UTF-8 vcs_info
  local -a messages
  local prompt_cursor
  local vcs_prompt
  local folder_icon

  #   $vcs_info_msg_0_ : 通常メッセージ用
  #   $vcs_info_msg_1_ : 警告メッセージ用
  #   $vcs_info_msg_2_ : エラーメッセージ用
  if [[ -z ${vcs_info_msg_0_} ]]; then
      # vcs_info で何も取得していない場合はプロンプトを表示しない
      vcs_prompt=""
      folder_icon=""
  else
      # vcs_info で情報を取得した場合
      # $vcs_info_msg_0_ , $vcs_info_msg_1_ , $vcs_info_msg_2_ を
      # それぞれ緑、黄色、赤で表示する
      [[ -n "$vcs_info_msg_0_" ]] && messages+=( "%F{green}${vcs_info_msg_0_}%f" )
      [[ -n "$vcs_info_msg_1_" ]] && messages+=( "%F{yellow}${vcs_info_msg_1_}%f" )
      [[ -n "$vcs_info_msg_2_" ]] && messages+=( "%F{red}${vcs_info_msg_2_}%f" )

      # 間にスペースを入れて連結する
      vcs_prompt="${(j: :)messages}"
      folder_icon=""
  fi
  # プロンプトに改行を入れるには、クオートを閉じずに改行すれば良い
  # ただし、インデントも反映されるので、改行する場合は左に詰める必要がある
  PROMPT="%F{034}${folder_icon} : %(1~,%1~,%~)${reset_color} ${vcs_prompt}
%F{red}❯ ${reset_color}"

}
# precmd にフックして、コマンドを実行する
add-zsh-hook precmd _precmd_vcs_info

# case ${USERNAME} in
# 'root')
# PROMPT=$PROMPT"
# %F{red}❯ ${reset_color}"
# 		;;
# *)
# PROMPT=$PROMPT"
# %F{red}❯ ${reset_color}"
# 		;;
# esac

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
