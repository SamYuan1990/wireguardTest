FROM ubuntu:bionic
RUN apt-get update
RUN apt install -y wireguard
RUN apt install -y iproute2
RUN apt install -y net-tools
RUN apt-get install -y iputils-ping traceroute

#RUN export DEBIAN_FRONTEND=noninteractive

#RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
#RUN apt-get install -y tzdata
#RUN dpkg-reconfigure --frontend noninteractive tzdata

#RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata

RUN apt-get install -y nginx

RUN mkdir -p /home/demo

RUN chgrp -R 0 /home/demo && \
    chmod -R g=u /home/demo

RUN mkdir -p /dev/net
RUN ls /dev/net/tun
#RUN chmod 0666 /dev/net/tun
RUN service nginx start
RUN apt-get install -y build-essential
# RUN apt-get -y insttall make
RUN apt-get install -y wget
RUN wget https://golang.org/dl/go1.15.3.linux-s390x.tar.gz
RUN tar -C /usr/local -xzf go1.15.3.linux-s390x.tar.gz 
ENV PATH=$PATH:/usr/local/go/bin
RUN apt-get install -y git
RUN git clone https://git.zx2c4.com/wireguard-go
RUN cd wireguard-go && make
RUN ls /dev/net/tun
#RUN /wireguard-go/wireguard-go wg0
COPY config1 /
COPY config2 /
EXPOSE 24464
EXPOSE 51348
CMD tail -f /dev/null
