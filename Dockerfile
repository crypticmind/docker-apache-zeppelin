#
# Docker container to run Apache Zeppelin
#
# Copyright (c) 2016 Carlos Ferreyra <crypticmind@gmail.com>
#
# Please see README.md for details.
#
# VERSION 0.0.1
#
FROM phusion/baseimage:0.9.19
MAINTAINER Carlos Ferreyra <crypticmind@gmail.com>

# The base image's init process
CMD ["/sbin/my_init"]

# Zeppelin will be available on this port
EXPOSE 8080

# Install required packages
ENV DEBIAN_FRONTEND noninteractive
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN apt-get install -y oracle-java8-installer net-tools git

# Copy configuration file and deploy Zeppelin
COPY fs /

# Location of externalized configuration files
VOLUME /config

# Location of externalized configuration files
VOLUME /storage

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
