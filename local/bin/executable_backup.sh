#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Usage: $0 <backup_root_dir>"
  exit 1
fi

backup_root_dir=$1
user_home=/home/sinkerine
backup_exec=/usr/local/bin/rsync_tmbackup.sh
rsync_flags="--super -a --numeric-ids --hard-links --one-file-system --itemize-changes --times --perms --stats --human-readable"

# backup pacman packages
pacman -Qqe | grep -vx "$(pacman -Qqm)" > $user_home/.backup/pacman-packages
pacman -Qqm > $user_home/.backup/pacman-packages-aur

if [ $(id -u) -ne 0 ]; then
  backup_exec="sudo ${backup_exec}"
fi

# run rsync time backup
$backup_exec -i ~/.ssh/nas_rsa  --rsync-set-flags "${rsync_flags}" /etc ${backup_root_dir}/etc $user_home/.time-backup-exclude-etc
$backup_exec -i ~/.ssh/nas_rsa --rsync-set-flags "${rsync_flags}" /home ${backup_root_dir}/home $user_home/.time-backup-exclude-home
