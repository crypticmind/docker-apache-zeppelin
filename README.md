
# docker-apache-zeppelin

Docker image with Apache Zeppelin

### Build

```
$ cd /path/to/docker-apache-zeppelin
$ docker build --rm --tag=crypticmind:zeppelin .
```

### Setup

TBD

```
$ docker run crypticmind:zeppelin \
    --name zeppelin --detach \
    --publish 8080:8080 \
    --volume /path/to/config:/config 
```

### Versions

* Base image is Phusion's [baseimage](https://github.com/phusion/baseimage-docker) 0.9.19 providing Ubuntu 16.04.
* Java 1.8
* Apache Zeppelin version 0.6.1

No particular revision was specified for Java. The current version provided by Ubuntu is used.

### License

This work is licensed under [MIT](https://opensource.org/licenses/MIT)

### Feedback

Feedback and contributions to the project, no matter what kind, are always very welcome.
