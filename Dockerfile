FROM	debian:jessie

LABEL	Author="Nathan Erwin <nathan.d.erwin@gmail.com>"

# install the JRE
ENV	JAVA_HOME /opt/jre1.8.0_141
ENV	JAVA_VERSION 8u141
ENV	JAVA_BUILD_VERSION b15
ENV	TOKEN 336fa29ff2bb4ef291e347e091f7f4a7

RUN	DEBIAN_FRONTEND=noninteractive apt-get update \
	&& apt-get -y install curl \
	&& cd /opt \
	&& curl --location --cookie oraclelicense=accept-securebackup-cookie http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$JAVA_BUILD_VERSION/$TOKEN/jre-$JAVA_VERSION-linux-x64.tar.gz | tar zx \ 
	&& chown -R root:root $JAVA_HOME \ 
	&& ln -s $JAVA_HOME/bin/java /usr/bin/java

