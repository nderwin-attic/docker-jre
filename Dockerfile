FROM	debian:jessie

LABEL	Author="Nathan Erwin <nathan.d.erwin@gmail.com>"

# install the JRE
ENV	JAVA_HOME=/opt/jre1.8.0_161 \
	JAVA_VERSION=8u161 \
	JAVA_BUILD_VERSION=b12 \
	TOKEN=2f38c3b165be4555a1fa6e98c45e0808

RUN	DEBIAN_FRONTEND=noninteractive apt-get update \
	&& apt-get -y install curl \
	&& cd /opt \
	&& curl --location --cookie oraclelicense=accept-securebackup-cookie http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$JAVA_BUILD_VERSION/$TOKEN/jre-$JAVA_VERSION-linux-x64.tar.gz | tar zx \ 
	&& chown -R root:root $JAVA_HOME \ 
	&& ln -s $JAVA_HOME/bin/java /usr/bin/java

