# Starting docker file.
FROM alpine as build1 -t q5test1
RUN apk add --no-cache git
RUN apk add --no-cache g++
RUN apk add --no-cache make
# Somewhere in this file, the following line must be included:
RUN git clone https://github.com/UAH-IC-Design-Team/hw01-q5-application.git
WORKDIR /hw01-q5-application
RUN make

FROM alpine as build2 -t q5test2
RUN apk add libstdc++
WORKDIR /apptest
COPY --from=build1 /hw01-q5-application/hw01-q5-application /apptest
CMD ["./hw01-q5-application"]
