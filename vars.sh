readonly CONFIG_DIR=$HOME/.emacs.d/config

readonly CONFIG_BASIC=`cat <<EOF
00_defmacros.el
00_defvars.el
01_basic.el
05_package.el
06_el-get.el
10_color-theme.el
10_auto-complete.el
ex-window-system-config.el
EOF`

absolute_path() {
    echo $(cd $(dirname $1) && pwd)/$(basename $1)
}
