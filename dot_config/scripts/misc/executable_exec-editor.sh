#!/bin/bash

which emacsclient > /dev/null && emacsclient -s misc -t -a vim $*
