# Starting docker file.

FROM alpine as build1
RUN apk add --no-cache git

# Somewhere in this file, the following line must be included:
RUN git clone https://github.com/UAH-IC-Design-Team/hw01-q5-application.git
WORKDIR hw01-q5-application
RUN make

FROM build1 as build2
RUN apd add libstdc++
COPY --from=build_1 /hw01-q5-application/hw01-q5-application
