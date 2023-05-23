FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive

ENV TZ=Europe/Copenhagen
ENV LANG C.UTF-8

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update
RUN apt -y install wget
RUN apt -y install build-essential 

RUN wget -O sdcc-snapshot --content-disposition=on https://sourceforge.net/projects/sdcc/files/snapshot_builds/amd64-unknown-linux2.5/sdcc-snapshot-amd64-unknown-linux2.5-20230523-14079.tar.bz2/download

RUN tar xf sdcc-snapshot

ENV PATH=$PATH:"/sdcc/bin"

RUN echo $PATH
