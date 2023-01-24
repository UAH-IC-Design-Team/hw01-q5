# escape=\ (backslash)
FROM python:alpine
WORKDIR /app
COPY . /app
FROM alpine:3.17

# Somewhere in this file, the following line must be included:
RUN git clone https://github.com/UAH-IC-Design-Team/hw01-q5-application.git
