#!/bin/sh
#
# mise manages language versions (ruby, node, ...). Everything pinned in
# mise/mise.xdg/config.toml (linked to ~/.config/mise) gets installed here,
# plus any machine-specific tools in the gitignored conf.d/local.toml.
#
# This runs from `dot` right after homebrew, before the topic installers,
# since those (like node/install.sh) expect mise and its languages to exist.

if test ! -x "$HOME/.local/bin/mise"
then
  curl https://mise.run | sh
fi

MISE="$HOME/.local/bin/mise"

"$MISE" plugins install perl
"$MISE" plugins install php

"$MISE" install

# mise/path.zsh only runs in interactive shells. GUI apps like neovide start
# a login shell instead, which reads ~/.zprofile, so put mise's shims there
# (it has to be .zprofile, macOS reorders PATH before then)
SHIMS='eval "$(~/.local/bin/mise activate zsh --shims)"'
if ! grep -qF "$SHIMS" "$HOME/.zprofile" 2>/dev/null
then
  printf '\n# mise shims for non-interactive shells (added by dotfiles mise/install.sh)\n%s\n' "$SHIMS" >> "$HOME/.zprofile"
fi
