# Starting docker file.

FROM alpine as build1
RUN apk add --no-cache git

# Somewhere in this file, the following line must be included:
RUN git clone https://github.com/UAH-IC-Design-Team/hw01-q5-application.git
RUN ls -a
WORKDIR hw01-q5-application
RUN ls -a
