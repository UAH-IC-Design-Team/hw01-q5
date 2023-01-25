# Starting docker file.
#FROM alpine as gitstuff
#COPY ./* /app
#WORKDIR /app
#RUN apk add --no-cache git
#CMD ["git","--version"]
# Somewhere in this file, the following line must be included:
#RUN git clone https://github.com/UAH-IC-Design-Team/hw01-q5-application.git
#RUN ls -a
#RUN cd hw01-q5-application
#RUN ls -a

FROM python:alpine3.17 as build
#COPY ./* /app
WORKDIR /app
#COPY --from=gitstuff /app hw01-q5-application.git
#RUN apk update
RUN apk add git && apk add g++ && apk add make
RUN git clone https://github.com/UAH-IC-Design-Team/hw01-q5-application.git
WORKDIR /app/hw01-q5-application
RUN make

#FROM purplei2p/i2pd:latest
FROM build as execute
#WORKDIR /app
COPY --from=build /app/hw01-q5-application/hw01-q5-application ./
#RUN apk add g++

ENTRYPOINT ["./hw01-q5-application"]






