FROM ubuntu:14.04
MAINTAINER Francois Gaudin <francois@presencelearning.com>

RUN apt-get update

RUN \
  apt-get install -y wget unzip

RUN \
  wget https://dl.bintray.com/mitchellh/consul/0.5.0_linux_amd64.zip -O /tmp/consul.zip && \
  unzip /tmp/consul.zip -d /usr/local/bin/ && \
  mkdir -p /opt/consul_ui && \
  wget https://dl.bintray.com/mitchellh/consul/0.5.0_web_ui.zip -O /tmp/consul_ui.zip && \
  unzip /tmp/consul_ui.zip -d /opt/consul_ui

RUN \
  apt-get remove -y wget unzip && \
  apt-get autoremove -y && \
  apt-get clean && rm -rf /var/lib/{apt,dpkg,cache,log,gems}/ && \
  rm -rf /tmp/*

COPY ./start.sh /opt/start.sh

RUN chmod +x /opt/start.sh

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 53/udp

CMD /opt/start.sh