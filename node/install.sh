#!/bin/sh
#
# Setting up the corepack stuff for yarn
#

if test ! $(which yarn)
then
  if test ! $(which mise)
  then
    mise use node@20
    corepack enable
    yarn set verion 1.22.22
  fi
fi
