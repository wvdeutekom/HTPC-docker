#! /bin/bash
# One click install script. Boot up sabnzbd, sickbeard

sh sabnzbd/startdocker.sh
# phasing out  sh sickbeard/startdocker.sh
sh sonarr/startdocker.sh
