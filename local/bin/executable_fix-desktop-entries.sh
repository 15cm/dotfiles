#/bin/bash
app_folder="/usr/share/applications"

# Plex
sudo sed -i 's/plexmediaplayer$/& --scale-factor 2/' $app_folder/plexmediaplayer.desktop
perl -pi -e 's/(Exec=)(?!env)/$1env LC_CTYPE=zh_CN.UTF-8 /' /usr/share/applications/emacs.desktop
