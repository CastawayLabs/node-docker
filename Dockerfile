FROM phusion/baseimage

ENV HOME /root

RUN apt-get update
RUN apt-get install -y git g++ gcc make autoconf python

EXPOSE 80

WORKDIR /tmp
RUN curl -L http://nodejs.org/dist/latest/node-v0.10.29.tar.gz | tar xzf -
WORKDIR node-v0.10.29
RUN ./configure && make
RUN make install

WORKDIR /
RUN rm -rf /tmp/node-v0.10.29*

RUN mkdir /etc/service/node_app
ADD run_app.sh /etc/service/node_app/run

RUN mkdir -p /root/.ssh
ADD ssh_config /root/.ssh/config

CMD ["/sbin/my_init"]
