#!/bin/bash

exec_exists() {
  pyenv which $1 > /dev/null 2>&1
}

fpath="$1"
fname="$(basename "$fpath")"

if exec_exists black && exec_exists isort && exec_exists docformatter && exec_exists pycln; then
  f="$(mktemp).py"
  black -q - | isort - | docformatter - > $f
  if [ "$fname" != "__init__.py" ]; then
    pycln -s $f
  fi
  cat $f
  rm -f $f
else
  cat
fi
