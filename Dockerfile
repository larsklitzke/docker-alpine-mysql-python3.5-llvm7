# use the latest mysql version
FROM python:3.5-alpine

# add mysql
RUN apk update && \
	apk add mysql mysql-client && \
	addgroup mysql mysql

# add python dev dependencies
RUN apk add libxml2-dev libxslt-dev && \
	rm -rf /var/cache/apk/*

