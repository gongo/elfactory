readonly CONFIG_DIR=`dirname $0`/../config
readonly CONFIG_ABSOLUTE_DIR=$(cd $(dirname ${CONFIG_DIR}) && pwd)/$(basename ${CONFIG_DIR})

readonly CONFIG_BASIC=`cat <<EOF
00_defmacros.el
00_defvars.el
01_basic.el
05_package.el
ex-window-system-config.el
EOF`

absolute_path() {
    echo $(cd $(dirname $1) && pwd)/$(basename $1)
}
