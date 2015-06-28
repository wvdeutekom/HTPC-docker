#! /bin/bash
. $(dirname $0)/../config

echo "Starting up sickbeard"

docker run -it \
--name ${sickbeard_containername} \
--restart=always \
-p ${sickbeard_ports} \
-v ${sickbeard_datadir}:/config \
${hub_username}/${sickbeard_hub_repository}:${sickbeard_imagename}
