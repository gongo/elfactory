readonly EMACS_DIR=${EMACS_DIR:="$HOME/.emacs.d"}
readonly CONFIG_DIR="${EMACS_DIR}/config"

#readonly CONFIG_LIST_MIN=`cat <<EOF
#00_defmacros.el
#00_defvars.el
#01_basic.el
#ex-window-system-config.el
#EOF`
#readonly CONFIG_LIST_BASIC="${CONFIG_LIST_MIN} `cat <<EOF
#05_package.el
#06_el-get.el
#10_anything.el
#10_auto-complete.el
#10_color-theme.el
#EOF`"

readonly CONFIG_LIST_MIN="`ls 0*.el ex-*.el`"
readonly CONFIG_LIST_BASIC="${CONFIG_LIST_MIN} `ls 1*.el`"

absolute_path() {
    echo $(cd $(dirname $1) && pwd)/$(basename $1)
}
