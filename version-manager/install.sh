#!/bin/sh
#
# This is a topic for version managers and getting languages all setup
# These days I'm using Mise which is like asdf at an even higher level
# I need a bunch of languages right now, so this gets all the plugins installed
#
#
curl https://mise.run | sh
echo 'eval "$(~/.local/bin/mise activate zsh)"'

mise plugin install perl
mise plugin install php

