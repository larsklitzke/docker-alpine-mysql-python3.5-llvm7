# use the latest mysql version
FROM python:3.5-alpine

RUN apk update && \
	apk add mysql mysql-client && \
	addgroup mysql mysql && \
	rm -rf /var/cache/apk/*


