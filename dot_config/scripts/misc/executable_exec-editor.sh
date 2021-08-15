#!/bin/bash

which emacsclient > /dev/null && emacsclient -s ~/local/run/emacs/misc -t -a vim $*
