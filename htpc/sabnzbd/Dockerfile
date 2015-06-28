FROM ubuntu:trusty
MAINTAINER Wijnand van Deutekom <wijnand@vdeute.com>

# Configure timezone
RUN echo "Europe/Amsterdam" > /etc/timezone; dpkg-reconfigure -f noninteractive tzdata

# set the locale
ENV DEBIAN_FRONTEND="noninteractive" \
    LANG="en_US.UTF-8" \
    LC_ALL="C.UTF-8" \
    LANGUAGE="en_US.UTF-8"

# install dependencies
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty multiverse" >> /etc/apt/sources.list && \
    apt-get -q update && \
    apt-get install -qy curl python-software-properties software-properties-common supervisor ca-certificates procps

# install sabnzbd
RUN add-apt-repository -y  ppa:jcfp/ppa && \
    apt-get -q update && \
    apt-get install -qy --force-yes  sabnzbdplus sabnzbdplus-theme-classic sabnzbdplus-theme-mobile sabnzbdplus-theme-plush \
    par2 python-yenc unzip unrar && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

ADD startup.sh /usr/local/bin/startup.sh
RUN chmod +x /usr/local/bin/startup.sh

# Create SickBeard user and set permissions
RUN useradd -c "SABnzbd User" sabnzbd && \
    mkdir -p /data/sabnzbd && \
    mkdir -p /data/nzb && \
    chown -R sabnzbd:sabnzbd /data/sabnzbd /data/nzb
VOLUME ["/data/sabnzbd"]
VOLUME ["/data/nzb"]

EXPOSE 8080

#CMD ["/usr/local/bin/startup.sh"]

ENTRYPOINT ["/usr/bin/sabnzbdplus", "--config-file", "/data/sabnzbd/sabnzbd.ini", "--server",":8080"]

