FROM	debian:jessie

MAINTAINER	Nathan Erwin <nathan.d.erwin@gmail.com>

RUN	DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y install curl

# install the JRE
ENV	JAVA_HOME /opt/jre1.8.0_60
ENV	JAVA_VERSION 8u60
ENV	JAVA_BUILD_VERSION b27

RUN	cd /opt && curl --location --cookie oraclelicense=accept-securebackup-cookie http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$JAVA_BUILD_VERSION/jre-$JAVA_VERSION-linux-x64.tar.gz | tar zx
RUN	ln -s $JAVA_HOME/bin/java /usr/bin/java

