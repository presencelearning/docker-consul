FROM ubuntu:14.04
MAINTAINER Francois Gaudin <francois@presencelearning.com>

RUN apt-get update

RUN \
  apt-get install -y wget unzip

RUN \
  wget https://dl.bintray.com/mitchellh/consul/0.5.0_linux_amd64.zip -O /tmp/consul.zip && \
  unzip /tmp/consul.zip -d /usr/local/bin/

RUN \
  apt-get remove -y wget unzip && \
  apt-get autoremove -y && \
  apt-get clean && rm -rf /var/lib/{apt,dpkg,cache,log,gems}/ && \
  rm -rf /tmp/*

COPY ./start.sh /opt/start.sh

RUN chmod +x /opt/start.sh

CMD /opt/start.sh