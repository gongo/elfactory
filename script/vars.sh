absolute_path() {
    echo $(cd $(dirname $1) && pwd)/$(basename $1)
}

# Deploy file directory

  readonly FACTORY_DIR="$(absolute_path `dirname $0`/..)"
  readonly FACTORY_CONFIG_DIR="${FACTORY_DIR}/config"

# Directory to deploy

  readonly EMACS_DIR=${EMACS_DIR:="$HOME/.emacs.d"}
  readonly CONFIG_DIR="${EMACS_DIR}/config"

#
# Deploy file list (absolute path)
#
#   min list = prefix "0?" or "ex" file. (e.g. 01-init.el, ex-hoge.el)
# basic list = min + prefix "1?" file.  (e.g. 10-fuga.el, 19-fuga.el)
#        all = all file
#

  readonly CONFIG_LIST_MIN="$(ls ${FACTORY_CONFIG_DIR}/{0?_,ex-}*.el)"
  readonly CONFIG_LIST_BASIC="${CONFIG_LIST_MIN} $(ls ${FACTORY_CONFIG_DIR}/1?_*.el)"
  readonly CONFIG_LIST_ALL="$(ls ${FACTORY_CONFIG_DIR}/*.el)"
