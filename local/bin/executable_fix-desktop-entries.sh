#/bin/bash
app_folder="/usr/share/applications"

sudo perl -pi -e 's/^(Exec=)(?!env)/$1env QT_SCREEN_SCALE_FACTORS=0 /' /usr/share/applications/calibre-gui.desktop
sudo perl -pi -e 's/^(Exec=)(?!env)/$1env QT_SCREEN_SCALE_FACTORS=0 /' /usr/share/applications/transgui.desktop
sudo perl -pi -e 's/^(Exec=)(?!env)/$1env QT_SCREEN_SCALE_FACTORS=1 /' /usr/share/applications/cura.desktop
sudo perl -pi -e 's/^(Exec=)(?!env)/$1env QT_SCREEN_SCALE_FACTORS=1 /' /usr/share/applications/goldendict.desktop

sudo sed -i 's/^Exec=plexmediaplayer$/& --fullscreen --desktop/' /usr/share/applications/plexmediaplayer.desktop
