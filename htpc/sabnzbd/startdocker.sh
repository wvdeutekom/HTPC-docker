#! /bin/bash
. $(dirname $0)/../config

echo "Starting up sabnzbd"

# Create the download dir if not exists,
# Then fix the rights to your download directory, otherwise access through nautilus is shit.
mkdir -p ${sab_downloaddir}
chown -R wijnand:wijnand ${sab_downloaddir}

sudo docker run -it \
--name ${sab_containername} \
--restart=always \
-p ${sab_ports} \
-v ${sab_nzbbackupdir}:/data/nzb \
-v ${sab_datadir}:/data/sabnzbd \
-v ${sab_downloaddir}:/data/downloads \
${hub_username}/${sab_hub_repository}:${sab_imagename}
