FROM ubuntu
RUN apt-get update
RUN apt install -y wireguard
RUN apt install -y iproute2
RUN apt install -y net-tools
RUN apt-get install -y iputils-ping
RUN echo 2 | apt-get install -y nginx

RUN service nginx start

CMD tail -f /dev/null
