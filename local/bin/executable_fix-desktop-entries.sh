#/bin/bash
app_folder="/usr/share/applications"

# Plex
sudo sed -i 's/plexmediaplayer$/& --scale-factor 2/' $app_folder/plexmediaplayer.desktop
