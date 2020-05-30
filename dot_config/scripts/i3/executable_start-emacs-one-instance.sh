#!/bin/bash

if [ -S /run/user/$UID/emacs/server ]; then
  emacsclient -s server -c
else
  LC_CTYPE=zh_CN.UTF-8 emacs
fi
