#!/bin/bash

## Set up the environment.

  . `dirname $0`/vars.sh

## Cleanup

  echo "Cleaning $(absolute_path ${CONFIG_DIR})"
  find ${CONFIG_DIR} -type l -exec rm {} \;
