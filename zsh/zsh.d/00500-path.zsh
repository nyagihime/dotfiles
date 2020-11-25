# ------------------------------------------------
# PATH
# ------------------------------------------------
# 手動でパスを登録する場合はここに記述。
# 記述順には注意！
# ------------------------------------------------

# export PATH="$HOME/Library/Python/2.7/bin:$PATH"
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# GoLang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Graphviz
export GRAPHVIZ_DOT=/usr/local/bin/dot

# python / tkinter
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/tcl-tk/lib"
export CPPFLAGS="-I/usr/local/opt/tcl-tk/include"
export PKG_CONFIG_PATH="/usr/local/opt/tcl-tk/lib/pkgconfig"
export PYTHON_CONFIGURE_OPTS="--with-tcltk-includes='-I/usr/local/opt/tcl-tk/include' --with-tcltk-libs='-L/usr/local/opt/tcl-tk/lib -ltcl8.6 -ltk8.6' --enable-shared"
if command -v pyenv 1>/dev/null 2>&1; then
 eval "$(pyenv init -)"
fi

# ICU4C
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
