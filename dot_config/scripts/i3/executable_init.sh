#!/bin/bash

# Sync with ~/.xprofile
systemd_envs=(
  DISPLAY
  XAUTHORITY
  QT_QPA_PLATFORMTHEME
  GTK2_RC_FILES
  XCURSOR_PATH
  QT_SCREEN_SCALE_FACTORS
  GDK_SCALE
  GDK_DPI_SCALE
  XDG_RUNTIME_DIR
  WINIT_HIDPI_FACTOR
  INPUT_METHOD
  GTK_IM_MODULE
  QT_IM_MODULE
  XMODIFIERS
)

systemctl --user import-environment ${systemd_envs[@]}

# Starting things with i3
systemctl --user start i3-session.target
