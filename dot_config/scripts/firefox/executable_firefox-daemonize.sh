#!/bin/bash

# Hide a Firefox window from wm to keep a Firefox instance running in background

prerequisites=(xdotool wmctrl)

for f in ${prerequisites[@]}; do
  if ! which $f > /dev/null 2>&1 ; then
    echo "Please install $f first"
    exit 1
  fi
done

f_x11_win_ids_old=$(mktemp)
f_x11_win_ids_new=$(mktemp)
f_x11_win_ids_old_sorted=$(mktemp)
f_x11_win_ids_new_sorted=$(mktemp)

xdotool search --classname 'Navigator' > $f_x11_win_ids_old

x11_win_num_old=$(wc -l < $f_x11_win_ids_old)
wm_win_num=$(wmctrl -lx | grep 'Navigator.Firefox' | wc -l)

# Not daemonize yet
if [ $x11_win_num_old = $wm_win_num ]; then
  nohup firefox --new-window "moz-extension://invalid" &
  # Wait until the new window appears
  while :; do
    xdotool search --classname 'Navigator' > $f_x11_win_ids_new
    # Wait if files are the same
    if cmp -s $f_x11_win_ids_old $f_x11_win_ids_new; then
      sleep 1
    else
      break
    fi
  done

  # Get id of the new window
  sort < $f_x11_win_ids_old > $f_x11_win_ids_old_sorted
  sort < $f_x11_win_ids_new > $f_x11_win_ids_new_sorted

  win_id=$(comm -13 $f_x11_win_ids_old_sorted $f_x11_win_ids_new_sorted)

  # Unmap(hide) the created window the keep Firefox running
  xdotool windowunmap $win_id
fi

rm -f $f_x11_win_ids_old $f_x11_win_ids_old_sorted $f_x11_win_ids_new $f_x11_win_ids_new_sorted
