#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 <backup_root_dir>"
  exit 1
fi

backup_root_dir=$1
user_home=/home/sinkerine
backup_exec=$user_home/local/bin/rsync_tmbackup.sh

# backup pacman packages
pacman -Qqe | grep -vx "$(pacman -Qqm)" > $user_home/.backup/pacman-packages
pacman -Qqm > $user_home/.backup/pacman-packages-aur

# run rsync time backup
if mount | grep -q auto.nas; then
  if [ $(id -u) = 0 ]; then
   $backup_exec  --rsync-set-flags '-D --compress --numeric-ids --links --hard-links --one-file-system --itemize-changes --times --recursive --perms --stats --human-readable' /etc ${backup_root_dir}/etc $user_home/.time-backup-exclude-etc
  else
    sudo $backup_exec  --rsync-set-flags '-D --compress --numeric-ids --links --hard-links --one-file-system --itemize-changes --times --recursive --perms --stats --human-readable' /etc ${backup_root_dir}/etc $user_home/.time-backup-exclude-etc
  fi
  $backup_exec --rsync-set-flags '-D --compress --numeric-ids --links --hard-links --one-file-system --itemize-changes --times --recursive --perms --stats --human-readable' /home ${backup_root_dir}/home $user_home/.time-backup-exclude-home
else
  echo "NAS is not mounted"
fi
