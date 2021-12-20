#!/bin/bash

if [ -S ~/local/run/emacs/server ]; then
  emacsclient -s ~/local/run/emacs/server -c
else
  emacs
fi
