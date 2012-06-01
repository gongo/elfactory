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
          CONFIG_LIST=$CONFIG_LIST_MIN
          ;;
      basic)
          CONFIG_LIST=$CONFIG_LIST_BASIC
          ;;
      all)
          CONFIG_LIST=$CONFIG_LIST_ALL
          ;;
      *)
          CONFIG_LIST=$CONFIG_LIST_ALL
          ;;
  esac

## Deploy

  echo "Deploying to ${CONFIG_DIR}"

  for f in ${CONFIG_LIST}
  do
      ln -s ${f} ${CONFIG_DIR}/
      echo "... $(basename ${f})"
  done
