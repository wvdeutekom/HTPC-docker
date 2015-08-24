#! /bin/bash
. $(dirname $0)/../config

echo "Starting up Sonarr"

sudo docker run -dit \
--restart always \
--name ${sonarr_containername} \
-p ${sonarr_ports} \
-v ${mnt_series}:/volumes/media \
-v ${sab_downloaddir}:/volumes/completed \
wvdeutekom/sonarr:latest
