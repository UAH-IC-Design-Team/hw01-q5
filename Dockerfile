# Starting docker file.
#Image 1
FROM alpine:3.17 AS Build1

RUN apk add git
RUN apk add g++
RUN apk add make


#Now run the application
# Somewhere in this file, the following line must be included:
RUN git clone https://github.com/UAH-IC-Design-Team/hw01-q5-application.git

#Change working dir to application
WORKDIR /hw01-q5-application
RUN make

#Image 2
FROM alpine:3.17 AS Build2
RUN apk add libstdc++
WORKDIR /Build_2_app
COPY --from=Build1 /hw01-q5-application/hw01-q5-application /Build_2_app

CMD [".hw01-q5-application"]