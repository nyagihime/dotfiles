# ------------------------------------------------
# PATH
# ------------------------------------------------
# 手動でパスを登録する場合はここに記述。
# 記述順には注意！
# ------------------------------------------------

# GoLang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Graphviz
export GRAPHVIZ_DOT=/usr/local/bin/dot

# python / tkinter
# export PATH="$HOME/Library/Python/2.7/bin:$PATH"
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/tcl-tk/lib"
export CPPFLAGS="-I/usr/local/opt/tcl-tk/include"
export PKG_CONFIG_PATH="/usr/local/opt/tcl-tk/lib/pkgconfig"
export PYTHON_CONFIGURE_OPTS="--with-tcltk-includes='-I/usr/local/opt/tcl-tk/include' --with-tcltk-libs='-L/usr/local/opt/tcl-tk/lib -ltcl8.6 -ltk8.6' --enable-shared"

# python / poetry
export PATH="/Users/yanagimachi/.local/bin:$PATH"

# ICU4C
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"

# Homebrew
# eval "$(/opt/homebrew/bin/brew shellenv)"
# ↑のコマンドで展開されるexportの中身を直接書き出したやつ↓
export HOMEBREW_PREFIX="/opt/homebrew"
export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
export HOMEBREW_REPOSITORY="/opt/homebrew"
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}"
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"

# PlatformIO
export PATH="/Users/nagi/.platformio/penv/bin:$PATH"

# ni config
# @https://github.com/antfu/ni
export NI_CONFIG_FILE=$DOTFILES/dotconfig/ni/nirc