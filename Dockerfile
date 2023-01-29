# Starting docker file.

FROM alpine as build1
RUN apk add --no-cache git
RUN apk add --no-cache g++
RUN apk add --no-cache make
# Somewhere in this file, the following line must be included:
RUN git clone https://github.com/UAH-IC-Design-Team/hw01-q5-application.git
WORKDIR hw01-q5-application
RUN make

FROM build1 as build2
RUN apk add libstdc++
RUN ls -a
WORKDIR /apptest
RUN ls -a
COPY --from=build_1 /hw01-q5-application/hw01-q5-application /apptest
RUN ls -a
CMD ["./hw01-q5-application.cpp"]
