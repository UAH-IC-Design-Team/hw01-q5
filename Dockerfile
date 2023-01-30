# Starting docker file.

# Somewhere in this file, the following line must be included:
FROM alpine:3.17 as stage1
#RUN apk update
RUN apk add git make
RUN apk add g++ libstdc++
RUN git clone https://github.com/UAH-IC-Design-Team/hw01-q5-application.git

WORKDIR /hw01-q5-application
RUN make


FROM alpine:3.17 as stage2
RUN apk add libstdc++
RUN mkdir /hw01-q5-stage2
COPY --from=stage1 /hw01-q5-application/hw01-q5-application /hw01-q5-stage2/


CMD ["/hw01-q5-stage2/hw01-q5-application"]
