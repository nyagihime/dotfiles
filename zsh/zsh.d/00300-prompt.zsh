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
zstyle ':vcs_info:git:*' stagedstr "%F{green} "

# unstagedstr の設定
# 変更があったけど、 git add されていないファイルがあると
# 表示されるメッセージのフォーマット
# formats に %u を書くと展開される
zstyle ':vcs_info:git:*' unstagedstr "%F{red} "

# $vcs_info_msg_0_ の書式設定
zstyle ':vcs_info:*' formats "%F{026}[ %b]%c%u %m%f"

# コンフリクトやマージ中など、特殊な状況のときは
# formats の代わりにこちらが表示される。
# %a でアクション名が展開される（actionformats でのみ使える）
zstyle ':vcs_info:*' actionformats '(%a)[ %b]'

# vcs_info フック関連
# formats / actionformats のメッセージが展開される直前にフック
# @see https://qiita.com/mollifier/items/8d5a627d773758dd8078
# @see https://sourceforge.net/p/zsh/code/ci/master/tree/Misc/vcs_info-examples
zstyle ':vcs_info:git+set-message:*' hooks\
  git-hook-begin\
  git-push-status

  # 最初に呼び出すフック。
  # .git ディレクトリ内部などにいる場合、リポジトリ内部にいるが、
  # git status --porcelain など一部の git コマンドが使えない（エラーになる）ため、
  # そういう場所では動かないようにする
  function +vi-git-hook-begin() {
    if [[ $(command git rev-parse --is-inside-work-tree 2> /dev/null) != 'true' ]]; then
      # 0以外を返すとそれ以降のフック関数は呼び出されない
      return 1
    fi

    return 0
  }

  # 未 push のコミット数を misc (%m) に表示
  function +vi-git-push-status() {
    # zstyle formats, actionformats の2番目のメッセージのみ対象にする

    # if [[ "$1" != "1" ]]; then
    #   return 0
    # fi

    # master ブランチでのみ実行
    # if [[ "${hook_com[branch]}" != "master"]]; then
    #   return 0
    # fi

    local ahead
    ahead=$(command git rev-list ${hook_com[branch]}@{upstream}..${hook_com[branch]} 2>/dev/null \
            | wc -l \
            | tr -d ' ')

        if [[ "$ahead" -gt 0 ]]; then
            # misc (%m) に追加
            hook_com[misc]+="%F{220}(  ${ahead})"
        fi
  }

# プロンプト組み立て
# この関数は precmd から呼ばれる
function _precmd_generate_left_prompt () {
  LANG=en_US.UTF-8 vcs_info
  local -a messages
  local prompt_cursor
  local vcs_prompt
  local folder_icon

  #   $vcs_info_msg_0_ : 通常メッセージ用
  #   $vcs_info_msg_1_ : 警告メッセージ用
  #   $vcs_info_msg_2_ : エラーメッセージ用
  #   -z 文字列の長さが0ならTRUE
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

  # プロンプト下段矢印マークの基本スタイル
  prompt_arrow="%F{red}❯${reset_color}"

  # $VIRTUAL_ENV を表示させる
  # ZSH でプロンプトをいじる場合、venvのアクティベートスクリプトによるプロンプト書き換えが
  # 上書かれるのか、うまく表示されないので、自力で実装する
  # .venv/bin/activate の中で PS1 を書き換えてるところと同じようなことをやればよい
  venv=""
  # -n 文字列の長さが0以上ならTRUE
  if [[ -n $VIRTUAL_ENV ]]; then
    # %F{024} / %F{239}
    venv="%F{024} $(basename "${VIRTUAL_ENV}")${reset_color}"
    prompt_arrow="%F{024}❯${reset_color}"
  fi


  # プロンプトに改行を入れるには、クオートを閉じずに改行すれば良い
  # ただし、インデントも反映されるので、改行する場合は左に詰める必要がある
  PROMPT="%F{034}${folder_icon} : %(1~,%1~,%~)${reset_color} ${vcs_prompt}
${venv}${prompt_arrow} "

}
# precmd にフックして、コマンドを実行する
add-zsh-hook precmd _precmd_generate_left_prompt

# root ユーザーのときはプロンプトの色を変える
# mac で root 昇格はまずないので外した
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
