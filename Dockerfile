FROM ubuntu:latest

ENV HOME /root

RUN apt-get update
RUN apt-get install -y git nodejs npm openssl

EXPOSE 80

RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN mkdir -p /root/.ssh
ADD ssh_config /root/.ssh/config

ADD nodegear_bootstrap.sh /usr/local/bin/nodegear_bootstrap
RUN chmod +x /usr/local/bin/nodegear_bootstrap

CMD ["/usr/local/bin/nodegear_bootstrap"]
