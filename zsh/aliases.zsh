alias reload!='. ~/.zshrc'

alias cls='clear' # Good 'ol Clear Screen command

diff-gem() {
  gem_a=$1
  gem_b=$2

  mkdir {new,old}

  tar xvzf $gem_a -C old
  tar xvzf $gem_b -C new

  tar xvzf old/data.tar.gz -C old
  tar xvzf new/data.tar.gz -C new

  diff -Ewburq new/lib/ old/lib/

  gunzip -d new/metadata.gz
  gunzip -d old/metadata.gz

  diff -u new/metadata old/metadata
}
