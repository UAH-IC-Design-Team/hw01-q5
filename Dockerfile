FROM alpine:3.17 AS Stage0
RUN apk update
RUN apk add git
RUN apk add g++
RUN apk add make
RUN git clone https://github.com/UAH-IC-Design-Team/hw01-q5-application.git
WORKDIR /hw01-q5-application
RUN make

FROM alpine:3.17 AS Stage1
RUN apk add libstdc++
WORKDIR /app
COPY --from=Stage0 /hw01-q5-application/hw01-q5-application /app
CMD ["./hw01-q5-application"]
