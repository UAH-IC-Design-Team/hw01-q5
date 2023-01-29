# Starting docker file.

# Somewhere in this file, the following line must be included:
FROM alpine as build1
RUN apk add g++
RUN apk add git
RUN apk add make

RUN git clone https://github.com/UAH-IC-Design-Team/hw01-q5-application.git
WORKDIR /hw01-q5-application
RUN make


#build2
FROM alpine as build2
RUN apk add libstdc++
WORKDIR /test
COPY --from=build1 /hw01-q5-application/hw01-q5-application /test
ENTRYPOINT ["./hw01-q5-application"]
 
