# Starting docker file.
FROM alpine:3.17 AS stage1
COPY ./* /app
WORKDIR  /app
RUN apk --no-cache add  git \
&& apk add g++ \
&& apk add make \
&& git clone https://github.com/UAH-IC-Design-Team/hw01-q5-application.git
WORKDIR /app/hw01-q5-application
RUN make

FROM alpine:3.17 AS stage2
RUN apk add libstdc++
COPY --from=stage1 /app/hw01-q5-application/hw01-q5-application ./
ENTRYPOINT ["./hw01-q5-application"]
