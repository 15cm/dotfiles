#!/bin/bash

if [ -S ~/local/run/emacs/server ]; then
  emacsclient -s ~/local/run/emacs/server -c
else
  LC_CTYPE=zh_CN.UTF-8 emacs
fi
