FROM ubuntu:bionic
RUN apt-get update
RUN apt install -y wireguard
RUN apt install -y iproute2
RUN apt install -y net-tools
RUN apt-get install -y iputils-ping

#RUN export DEBIAN_FRONTEND=noninteractive

#RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
#RUN apt-get install -y tzdata
#RUN dpkg-reconfigure --frontend noninteractive tzdata

#RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata

RUN apt-get install -y nginx

RUN mkdir -p /home/demo

RUN chgrp -R 0 /home/demo && \
    chmod -R g=u /home/demo

RUN service nginx start

CMD tail -f /dev/null
