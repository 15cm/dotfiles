#/bin/bash
app_folder="/usr/share/applications"

# Emacs
sudo perl -pi -e 's/(Exec=)(?!env)/$1env LC_CTYPE=zh_CN.UTF-8 /' /usr/share/applications/emacs.desktop
