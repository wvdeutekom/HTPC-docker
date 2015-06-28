FROM ubuntu:trusty
MAINTAINER Wijnand van Deutekom <wijnand@vdeute.com>

ENV SICKBEARD_VERSION master

RUN apt-get update && \
apt-get install -qy --force-yes \
python-cheetah \
wget \
tar \
ca-certificates \
curl

RUN curl -L https://github.com/midgetspy/Sick-Beard/tarball/$SICKBEARD_VERSION -o sickbeard.tgz && \
 tar -xvf sickbeard.tgz -C /  &&\
 mv /midgetspy-Sick-Beard-* /sickbeard/ &&\
 rm  /sickbeard.tgz

# apt clean
RUN apt-get clean &&\
  rm -rf /var/lib/apt/lists/* &&\
  rm -rf /tmp/*

ADD init.sh /opt/scripts/init.sh
RUN chmod u+x  /opt/scripts/init.sh
 
VOLUME /config
VOLUME /data

EXPOSE 8081

CMD ["/opt/scripts/init.sh"]
