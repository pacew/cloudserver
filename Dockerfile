FROM ubuntu
RUN apt update
RUN apt-get install -y apache2 telnet
COPY startup /startup


