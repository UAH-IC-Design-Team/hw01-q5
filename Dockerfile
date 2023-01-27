# Starting docker file.

# Somewhere in this file, the following line must be included:

# Image 1

FROM alpine:3.17 as build_1

RUN apk update
RUN apk add git
RUN apk add g++
RUN apk add make
RUN apk add libstdc++

RUN git clone https://github.com/UAH-IC-Design-Team/hw01-q5-application.git

WORKDIR /hw01-q5-application
RUN make

FROM alpine:3.17 as build_2
RUN apk add libstdc++
RUN mkdir /hw1-q5-build_2
COPY --from=build_1 /hw01-q5-application/hw01-q5-application /hw1-q5-build_2/

CMD ["/hw1-q5-build_2/hw01-q5-application"]
