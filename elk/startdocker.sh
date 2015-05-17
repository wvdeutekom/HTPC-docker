baseimagename="service-elk"
datavolumename="datavolume-elk"

find=$(docker ps -a | grep ${datavolumename} | awk '{ print $7;}')
if [ -z $find ]; then
    docker create -v /data --name ${datavolumename} aaahboogie/htpc:${baseimagename}
else
    echo "Found ${find}, dont have to create a new datavolume"
fi

docker run -p 8080:80 \
    -v $PWD/logstash:/etc/logstash \
    -v $PWD/supervisor:/etc/supervisor \
    --volumes-from datavolume-elk \
    aaahboogie/htpc:service-elk
