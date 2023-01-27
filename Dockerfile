# Starting docker file.
FROM alpine:3.17 AS build
RUN apk update && apk add git
RUN apk add g++ && apk add make
RUN git clone https://github.com/UAH-IC-Design-Team/hw01-q5-application.git
WORKDIR /hw01-q5-application
RUN make 


FROM alpine:3.17
RUN apk add libstdc++
WORKDIR /root/
COPY --from=build /hw01-q5-application/hw01-q5-application .
ENTRYPOINT ["./hw01-q5-application"]
 



