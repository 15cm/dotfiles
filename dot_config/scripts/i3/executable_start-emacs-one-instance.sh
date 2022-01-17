#!/bin/bash

if [ $# -eq 1 ] && [ $1 = "-f" ]; then
  rm ~/local/run/emacs/server
fi

if [ -S ~/local/run/emacs/server ]; then
  emacsclient -s ~/local/run/emacs/server -c
else
  emacs
fi
