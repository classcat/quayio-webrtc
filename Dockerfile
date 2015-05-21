FROM ubuntu:trusty
MAINTAINER ClassCat Co.,Ltd. <support@classcat.com>

########################################################################
# ClassCat/WebRTC Dockerfile
#   Maintained by ClassCat Co.,Ltd ( http://www.classcat.com/ )
########################################################################

#--- HISTORY -----------------------------------------------------------
# 21-may-15 : fixed.
# 21-may-15 : Created for quay.io.
#-----------------------------------------------------------------------

RUN apt-get update && apt-get -y upgrade \
  && apt-get install -y language-pack-en language-pack-en-base \
  && apt-get install -y language-pack-ja language-pack-ja-base \
  && update-locale LANG="en_US.UTF-8" \
  && apt-get install -y openssh-server supervisor rsyslog mysql-client \
  && mkdir -p /var/run/sshd \
  && sed -ri "s/^PermitRootLogin\s+.*/PermitRootLogin yes/" /etc/ssh/sshd_config

# RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

ADD assets/supervisord.conf /etc/supervisor/supervisord.conf

WORKDIR /usr/local
RUN apt-get -y install g++ make unzip && apt-get clean \
  && wget http://nodejs.org/dist/v0.10.37/node-v0.10.37.tar.gz \
  && tar xfz node-v0.10.37.tar.gz \
  && cd node-v0.10.37 \
  && ./configure && make && make install \
  && cd .. \
  && wget http://easyrtc.com/files/easyrtc_server_example.zip \
  && unzip easyrtc_server_example.zip -d easyrtc_server_example \
  && cd easyrtc_server_example \
  && npm install

WORKDIR /opt
ADD assets/cc-init.sh /opt/cc-init.sh

EXPOSE 22 8080

CMD /opt/cc-init.sh; /usr/bin/supervisord -c /etc/supervisor/supervisord.conf
