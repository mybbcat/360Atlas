#
# Dockerfile for 360Atlas
#


FROM ubuntu:latest
MAINTAINER kev<noreply@datageek.info>

WORKDIR /usr/local

RUN apt-get update
	&& apt-get install wget
	&& wget https://github.com/Qihoo360/Atlas/releases/download/2.2/Atlas-2.2-debian7.0-x86_64.deb
	&& apt-get remove wget
	&& dpkg -i  Atlas-2.2-debian7.0-x86_64.deb
	&& apt-get update & apt-get install mysql-client-5.6
	&& sed -i '$a /usr/local/mysql-proxy/bin/mysql-proxyd test start' /etc/bash.bashrc