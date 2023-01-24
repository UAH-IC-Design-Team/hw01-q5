# Starting docker file.
FROM alpine as gitstuff
WORKDIR /app
RUN apk add --no-cache git
CMD ["git","--version"]
RUN git clone https://github.com/UAH-IC-Design-Team/hw01-q5-application.git

FROM python:alpine3.17
WORKDIR /app
COPY --from=gitstuff /app hw01-q5-application.git

ENTRYPOINT ["python","hw01-q5-application.git"]



# Somewhere in this file, the following line must be included:





