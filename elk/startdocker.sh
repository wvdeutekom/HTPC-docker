containername="service-elk"
baseimagename="service-elk-build"
datavolumename="datavolume-elk"

find=$(docker ps -a | grep ${datavolumename} | awk '{ print $7;}')
if [ -z $find ]; then
    docker create -v /data --name ${datavolumename} aaahboogie/htpc:${baseimagename}
else
    echo "Found ${find}, dont have to create a new datavolume"
fi

docker run -it \
    -p 80:80 \
    -v $PWD/logstash/config:/etc/logstash \
    --volumes-from datavolume-elk \
    --name ${containername} \
    aaahboogie/htpc:${baseimagename}



#    -v $PWD/supervisor:/etc/supervisor \
