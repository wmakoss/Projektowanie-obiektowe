FROM ubuntu:22.04

ENV TZ=Europe/Warsaw

RUN apt-get update

RUN apt-get install -y wget

RUN apt-get install -y git

RUN apt-get install -y curl

RUN apt-get install -y build-essential

RUN apt-get install -y unzip

RUN apt-get install -y fp-compiler

RUN apt-get install -y gnucobol4

RUN apt-get install -y gdb

RUN apt-get install -y sudo

RUN mkdir /root/application

# VOLUME /root/application

COPY ./application /root/application

WORKDIR /root/application

RUN fpc main.pas

CMD ["./main"]
