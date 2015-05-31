FROM ubuntu:14.04
MAINTAINER Wijnand van Deutekom <wijnand@evalytics.nl>

# Configure timezone
RUN echo "Europe/Amsterdam" > /etc/timezone; dpkg-reconfigure -f noninteractive tzdata

#install apache
RUN apt-get install && apt-get install -y apache2

# Set the locale
RUN locale-gen en_US.UTF-8
RUN locale-gen nl_NL.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV LC_MONETARY nl_NL.UTF-8

# Remove existing apache2 conf
RUN rm -rf /etc/apache2/

# Load the apache configurations
ADD startup.sh /usr/local/bin/startup.sh
#ADD apache2 /etc/apache2

# Make it executable
RUN chmod +x /usr/local/bin/startup.sh

# Fix permissions
RUN usermod -u 1000 www-data

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/usr/local/bin/startup.sh"]
