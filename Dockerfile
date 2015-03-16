FROM ubuntu:14.04
MAINTAINER Francois Gaudin <francois@presencelearning.com>

RUN apt-get update

RUN \
  apt-get install -y unzip curl

RUN \
  curl --silent -L -o /tmp/consul.zip https://dl.bintray.com/mitchellh/consul/0.5.0_linux_amd64.zip && \
  unzip /tmp/consul.zip -d /usr/local/bin/ && \
  mkdir -p /opt/consul_ui && \
  curl --silent -L -o /tmp/consul_ui.zip https://dl.bintray.com/mitchellh/consul/0.5.0_web_ui.zip && \
  unzip /tmp/consul_ui.zip -d /opt/consul_ui

RUN \
  apt-get remove -y unzip && \
  apt-get autoremove -y && \
  apt-get clean && rm -rf /var/lib/{apt,dpkg,cache,log,gems}/ && \
  rm -rf /tmp/*

COPY ./start.sh /opt/start.sh

RUN chmod +x /opt/start.sh

EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 53/udp

ENTRYPOINT ["/opt/start.sh"]