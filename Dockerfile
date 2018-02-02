FROM debian:jessie
MAINTAINER Alex Wilson a.wilson@alumni.warwick.ac.uk

ENV JAVA_HOME /opt/java
ENV PATH /opt/flume/bin:/opt/java/bin:$PATH
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq \ 
    && apt-get install -q -y --no-install-recommends wget \
    && mkdir /opt/java \ 
    && wget --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" -qO- \
          http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808/server-jre-8u161-linux-x64.tar.gz \
          | tar zxvf - -C /opt/java --strip 1 \
    && mkdir /opt/flume \ 
    && wget -qO- http://archive.apache.org/dist/flume/1.8.0/apache-flume-1.8.0-bin.tar.gz \
          | tar zxvf - -C /opt/flume --strip 1

ADD jars/hadoop-common-2.7.3.jar /opt/flume/lib
ADD jars/hadoop-auth-2.7.3.jar /opt/flume/lib
ADD jars/commons-configuration-1.6.jar /opt/flume/lib
ADD jars/hadoop-hdfs-2.7.3.jar /opt/flume/lib
ADD jars/hadoop-mapreduce-client-core-2.7.3.jar /opt/flume/lib
ADD jars/htrace-core-3.1.0-incubating.jar /opt/flume/lib
ADD jars/commons-io-2.4.jar /opt/flume/lib
ADD jars/zookeeper-3.5.2-alpha.jar /opt/flume/lib

ADD start-flume.sh /opt/flume/bin/start-flume

ENTRYPOINT [ "start-flume" ]
