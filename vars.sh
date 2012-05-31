readonly EMACS_DIR=${EMACS_DIR:="$HOME/.emacs.d"}
readonly CONFIG_DIR="${EMACS_DIR}/config"

readonly CONFIG_LIST_MIN="`ls 0*.el ex-*.el`"
readonly CONFIG_LIST_BASIC="${CONFIG_LIST_MIN} `ls 1*.el`"

absolute_path() {
    echo $(cd $(dirname $1) && pwd)/$(basename $1)
}
