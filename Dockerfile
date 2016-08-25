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
RUN apt-get install -y oracle-java8-installer net-tools git wget
RUN wget http://mirrors.dcarsat.com.ar/apache/zeppelin/zeppelin-0.6.1/zeppelin-0.6.1-bin-all.tgz
RUN tar xvfz zeppelin-0.6.1-bin-all.tgz
RUN mv zeppelin-0.6.1-bin-all zeppelin
RUN mkdir -p /opt
RUN mv zeppelin /opt
RUN rm zeppelin-0.6.1-bin-all.tgz

# Copy configuration file and deploy Zeppelin
COPY fs /

# Location of externalized configuration files
VOLUME /config

# Location of externalized configuration files
VOLUME /storage

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
