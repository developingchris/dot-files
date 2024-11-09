#!/bin/sh

echo 'eval "$(~/.local/bin/mise activate zsh)"'
mise install ruby@2.6.10
mise install ruby@3.1
mise install ruby@3.2
mise install ruby@3.3
mise use -g ruby@3.3
