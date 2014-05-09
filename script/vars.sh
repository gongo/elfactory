absolute_path() {
    echo $(cd -- "$(dirname $1)" && pwd)/$(basename $1)
}

# Deploy file directory

  readonly FACTORY_DIR="$(absolute_path `dirname $0`/..)"
  readonly FACTORY_CONFIG_DIR="${FACTORY_DIR}/config"

# Directory to deploy

  readonly EMACS_DIR=${EMACS_DIR:="$HOME/.emacs.d"}
  readonly CONFIG_DIR="${EMACS_DIR}/config"
