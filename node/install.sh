#!/bin/sh
#
# Setting up the corepack stuff for yarn
#

MISE="$HOME/.local/bin/mise"

if ! "$MISE" exec -- which yarn > /dev/null 2>&1
then
  "$MISE" exec -- corepack enable
  "$MISE" exec -- corepack prepare yarn@1.22.22 --activate
fi
