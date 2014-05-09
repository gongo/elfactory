#!/bin/bash

## Set up the environment.

  set -e
  readonly DIR=`dirname $0`
  . ${DIR}/vars.sh

## Deploy directory and initialize file.

  echo "Deploy at"

  if [ ! -d "$CONFIG_DIR" ] ; then
      mkdir "$CONFIG_DIR"
      echo "  .. ${CONFIG_DIR} create"
  else
      echo "  .. ${CONFIG_DIR} is already exists"
  fi

  for i in init.el vendor
  do
      TARGET="${EMACS_DIR}/${i}"
      if [ ! -h "${TARGET}" ]
      then
          echo "  .. ${TARGET}"
          ln -s ${FACTORY_DIR}/${i} ${EMACS_DIR}/
      else
          echo "  .. ${TARGET} is already exists"
      fi
  done
