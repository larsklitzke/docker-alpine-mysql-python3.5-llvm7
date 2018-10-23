# use the latest mysql version
FROM python:3.5.6-alpine3.8
MAINTAINER Lars Klitzke <Lars.Klitzke@gmail.com>

# VERSIONS
ENV ALPINE_VERSION=3.8 \
    PYTHON_VERSION=3.5.6

# add mysql
RUN apk update && \
	apk --no-cache add mysql mysql-client && \
	addgroup mysql mysql

# add python dev dependencies
RUN apk --no-cache add \
	autoconf \
	automake \
	freetype-dev \
	g++ \
	gcc \
	jpeg-dev \
	lcms2-dev \
	libffi-dev \
	libpng-dev \
	libwebp-dev \
	linux-headers \
	make \
	py3-psycopg2 \
	openjpeg-dev \
	tiff-dev \
	zlib-dev \
	libxml2-dev \
	libxslt-dev

# Ensure pip is installed
RUN	python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    test -e /usr/bin/pip || ln -s /usr/bin/pip3 /usr/bin/pip;

# Upgrade setuptools and install some python packages
RUN pip install --no-cache-dir -U \
    setuptools \
    lxml \
    pymysql