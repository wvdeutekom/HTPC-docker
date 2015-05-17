# Pull base image.
FROM ubuntu:14.04
MAINTAINER Wijnand van Deutekom <wijnand@vdeute.com>

# Install Java.
RUN \
 echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
 apt-get update && \
 apt-get install -y software-properties-common && \
 add-apt-repository -y ppa:webupd8team/java && \
 apt-get update && \
 apt-get install -y oracle-java8-installer && \
 rm -rf /var/lib/apt/lists/* && \
 rm -rf /var/cache/oracle-jdk8-installer

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y supervisor curl

# Elasticsearch
RUN \
    apt-key adv --keyserver pool.sks-keyservers.net --recv-keys 46095ACC8548582C1A2699A9D27D666CD88E42B4 && \
    if ! grep "elasticsearch" /etc/apt/sources.list; then echo "deb http://packages.elasticsearch.org/elasticsearch/1.4/debian stable main" >> /etc/apt/sources.list;fi && \
    if ! grep "logstash" /etc/apt/sources.list; then echo "deb http://packages.elasticsearch.org/logstash/1.4/debian stable main" >> /etc/apt/sources.list;fi && \
    apt-get update

RUN \
    apt-get install -y elasticsearch && \
    apt-get clean && \
    sed -i '/#cluster.name:.*/a cluster.name: logstash' /etc/elasticsearch/elasticsearch.yml && \
    sed -i '/#path.data: \/path\/to\/data/a path.data: /data' /etc/elasticsearch/elasticsearch.yml

ADD supervisor/conf.d/elasticsearch.conf /etc/supervisor/conf.d/elasticsearch.conf

# Logstash
RUN apt-get install -y logstash logstash-contrib && \
    apt-get clean

ADD supervisor/conf.d/logstash.conf /etc/supervisor/conf.d/logstash.conf

# Kibana
RUN \
    curl -s https://download.elasticsearch.org/kibana/kibana/kibana-4.0.2-linux-x64.tar.gz | tar -C /opt -xz && \
    ln -s /opt/kibana-4.0.2-linux-x64 /opt/kibana && \
    sed -i 's/port: 5601/port: 80/' /opt/kibana/config/kibana.yml

ADD supervisor/conf.d/kibana.conf /etc/supervisor/conf.d/kibana.conf

EXPOSE 80

CMD [ "/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf" ]
