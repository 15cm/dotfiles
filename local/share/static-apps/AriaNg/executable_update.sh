#!/bin/bash
zip_name="master.zip"
dir_name="AriaNg-DailyBuild-master"
dist_name="build"
[ -f $zip_name ] && rm $zip_name
[ -d $dist_name ] && rm -r $dist_name
wget https://github.com/mayswind/AriaNg-DailyBuild/archive/master.zip
unzip $zip_name
mv $dir_name $dist_name
[ -f $zip_name ] && rm $zip_name
