docker run -it \
-h your_host_name \
-v /your_config_location:/config \
-v /home/wijnand/Downloads/sabnzbd:/data \
-p 7070:7070 \
--name=sabnzbd \
sabnzbd
