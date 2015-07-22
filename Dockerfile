FROM	debian:jessie

MAINTAINER	Nathan Erwin <nathan.d.erwin@gmail.com>

RUN	DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y install curl

# install the JRE
ENV	JAVA_HOME /opt/jre1.8.0_51
ENV	JAVA_VERSION 8u51
ENV	JAVA_BUILD_VERSION b16

WORKDIR	/opt
RUN	curl --location --cookie oraclelicense=accept-securebackup-cookie http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$JAVA_BUILD_VERSION/jre-$JAVA_VERSION-linux-x64.tar.gz | tar zx
RUN	ln -s $JAVA_HOME/bin/java /usr/bin/java

# create a non-root user for shell logins
RUN	groupadd -r jre && useradd -r -m -g jre jre

USER	jre

WORKDIR	/home/jre

CMD ["/bin/bash"]
