#/bin/bash
app_folder="/usr/share/applications"

# bluz-git
sudo sed -i 's|\(ExecStart=\).*|\1/usr/lib/bluetoothd|' /usr/lib/systemd/system/bluetooth.service

# Plex
sudo rm -f $app_folder/plexmediaplayer.desktop
sudo sed -i 's/Exec=\S*$/& --desktop --scale-factor=2/' $app_folder/plex-media-player.desktop

sudo systemctl daemon-reload

# Emacs
sudo perl -p -i -e 's/(Exec=)(?!env)/$1env LC_CTYPE=zh_CN.UTF-8 /' /usr/share/applications/emacs.desktop
