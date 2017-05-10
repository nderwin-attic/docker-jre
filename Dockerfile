FROM	debian:jessie

LABEL	Author="Nathan Erwin <nathan.d.erwin@gmail.com>"

RUN	DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y install curl

# install the JRE
ENV	JAVA_HOME /opt/jre1.8.0_131
ENV	JAVA_VERSION 8u131
ENV	JAVA_BUILD_VERSION b11
ENV	TOKEN d54c1d3a095b4ff2b6607d096fa80163

RUN	cd /opt && curl --location --cookie oraclelicense=accept-securebackup-cookie http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$JAVA_BUILD_VERSION/$TOKEN/jre-$JAVA_VERSION-linux-x64.tar.gz | tar zx
RUN	ln -s $JAVA_HOME/bin/java /usr/bin/java

