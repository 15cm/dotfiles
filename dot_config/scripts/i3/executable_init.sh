#!/bin/bash

# Keyboard settings: repeat_delay repeat_rate
xset r rate 450 24

# Autostart applications
ps cax | grep -q copyq || copyq &
ps cax | grep -q goldendict || goldendict &
ps cax | grep -q keepassxc || keepassxc &
ps cax | grep -q syncthing-gtk || syncthing-gtk &

# Applet
ps cax | grep -q polkit-gnome-au || /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
ps cax | grep -q nm-applet || nm-applet &
ps cax | grep -q blueman-applet || blueman-applet &
ps cax | grep -q xfce4-power-manager || xfce4-power-manager &
ps cax | grep -q pamac-tray || pamac-tray &
ps cax | grep -q redshift-gtk || redshift-gtk &
ps cax | grep -q pasystray || pasystray &
ps cax | grep -q fcitx || fcitx &

# Essentials
xautolock -time 300 -locker blurlock &
autorandr -l default &

# Starting things with i3
systemctl --user start xsession.target &
