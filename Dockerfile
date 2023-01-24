# Starting docker file.

# Somewhere in this file, the following line must be included:

# Image 1

FROM alpine:3.17 as init_build

RUN mkdir ~/hw1-q5-build

WORKDIR ~/hw1-q5-build

RUN apk update
RUN apk add git
RUN apk add g++
RUN apk add make

RUN git clone https://github.com/UAH-IC-Design-Team/hw01-q5-application.git

FROM init_build as build_1
RUN mkdir ~/hw1-q5-build_2
RUN cd hw1-q5-build
COPY hw01-5-application.cpp ~/hw1-q5-build_2
Run make /hw01-5-application.cpp
