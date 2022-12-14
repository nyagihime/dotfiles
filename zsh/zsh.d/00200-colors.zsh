# ------------------------------------------------
# 配色関係
# ------------------------------------------------
# カラースキームなどの定義はここ
# ------------------------------------------------

# 色名でプロンプトの色を変えられるように
autoload -Uz colors # black red green yellow blue magenta cyan white
colors

# ------------------------------------------------
# LS 時の配色（LS_COLORS）
# ------------------------------------------------
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
