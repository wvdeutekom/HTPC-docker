#! /bin/bash
. $(dirname $0)/../config

echo "Starting up sickbeard"

docker run -dit \
--name ${sickbeard_containername} \
--restart=always \
-p ${sickbeard_ports} \
-v ${sickbeard_datadir}:/data/sabnzbd \
${hub_username}/${sickbeard_hub_repository}:${sickbeard_imagename}
