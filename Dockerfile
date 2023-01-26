# Starting docker file.

# Somewhere in this file, the following line must be included:

# Image 1

FROM alpine:3.17 as build_1

#RUN mkdir /hw1-q5-build
WORKDIR /hw1-q5-build

RUN apk update
RUN apk add git
RUN apk add g++
RUN apk add make
RUN apk add libstdc++

#RUN cd /hw1-q5-build
RUN git clone https://github.com/UAH-IC-Design-Team/hw01-q5-application.git
#RUN cd /hw1-q5-build
RUN ls -a
#RUN cd hw01-q5-application
RUN make ./hw01-q5-application
RUN ls -a
#RUN ./hw01-q5-application/hw01-q5-application
RUN cd hw01-q5-application
RUN ls -a

FROM build_1 as build_2
#RUN mkdir /hw1-q5-build_2
RUN apk add libstdc++
WORKDIR /hw1-q5-build_2
COPY --from=build_1 /hw1-q5-build_/hw01-q5-application/hw01-q5-application /hw1-q5-build_2

ENTRYPOINT ["/hw1-q5-build_2"]
RUN ./hw01-q5-application
