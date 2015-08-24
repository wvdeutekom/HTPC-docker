#! /bin/bash
. $(dirname $0)/../config

echo "Starting up sickbeard"

sudo docker run -dit \
--name ${sickbeard_containername} \
--restart=always \
-p ${sickbeard_ports} \
-v ${sickbeard_datadir}:/config \
-v ${sab_downloaddir}:/data/sabdownloads \
-v ${sickbeard_destdir}:/data/downloaddestination \
${hub_username}/${sickbeard_hub_repository}:${sickbeard_imagename}



#--link ${sab_containername}:sabnzbd \
