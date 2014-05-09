#!/bin/bash
#
# ./deploy.sh {min|basic|all}
#

## Set up the environment.

  set -e
  readonly DIR=`dirname $0`
  . ${DIR}/vars.sh

## Cleanup

  ${DIR}/clean.sh

## Target Emacs Lisp List

  case $1 in
      min)
          CONFIG_LIST="$(ls ${FACTORY_CONFIG_DIR}/[^1-9]*.el)"
          ;;
      all)
          CONFIG_LIST="$(ls ${FACTORY_CONFIG_DIR}/*.el)"
          ;;
  esac

## Deploy

  echo "Deploying to ${CONFIG_DIR}"

  for f in ${CONFIG_LIST}
  do
      ln -s ${f} ${CONFIG_DIR}/
      echo "... $(basename ${f})"
  done
