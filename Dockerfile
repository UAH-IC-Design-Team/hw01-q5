# Starting docker file.

# Somewhere in this file, the following line must be included:
FROM alpine:3.17 AS build_1

RUN apk update

RUN apk add git

RUN apk add g++

RUN apk add make

RUN git clone https://github.com/UAH-IC-Design-Team/hw01-q5-application.git

WORKDIR /hw01-q5-application

RUN make

FROM alpine:3.17

RUN apk add libstdc++

WORKDIR /root/

COPY --from=build_1 /hw01-q5-application/hw01-q5-application /root

CMD ["./hw01-q5-application"]




