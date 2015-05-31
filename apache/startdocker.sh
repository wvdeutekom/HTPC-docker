docker run -it \
-p 80:80 -p 443:443 \
-v /home/wijnand/apache/home/www:/home/www \
--name apache \
aaahboogie/htpc:apache-build /bin/bash
