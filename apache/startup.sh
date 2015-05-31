#! /bin/bash
set -e

service apache2 start

homefolderchowned=$(stat -c %U /home/www)

if [[ $homefolderchowned = "www-data" ]]; then
	echo "skipping homefolder chown, already chowned"
else 
	echo "chown -R www-data:www-data /home/www"
	chown -R www-data:www-data /home/www
fi

while ( true )
    do
    echo "Detach with Ctrl-p Ctrl-q. Dropping to shell"
    sleep 1
    /bin/bash
done
