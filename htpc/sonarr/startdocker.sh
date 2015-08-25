#! /bin/bash
. $(dirname $0)/../config

echo "Starting up Sonarr"

sudo docker run -dit \
--restart always \
--name ${sonarr_containername} \
-p ${sonarr_ports} \
-v ${mnt_series}:/volumes/media \
-v ${sonarr_datadir}:/volumes/config \
-v ${sab_downloaddir}:/volumes/completed \
--link ${sab_containername}:sabnzbd \
wvdeutekom/sonarr:latest
