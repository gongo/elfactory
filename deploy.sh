#!/bin/bash
#
# ./deploy.sh {basic|xxx}
#

## Set up the environment.

  set -e
  readonly DIR=`dirname $0`
  . ${DIR}/vars.sh

## Cleanup

  ${DIR}/clean.sh

## Target Emacs Lisp List

  case $1 in
      basic)
          CONFIG_LIST=$CONFIG_BASIC
          ;;
      *)
          ;;
  esac

## Deploy

  echo "Deploying to $(absolute_path ${CONFIG_DIR})"

  for f in ${CONFIG_LIST}
  do
      ln -s $(absolute_path ${DIR})/${f} ${CONFIG_DIR}/
      echo "... ${f}"
  done
