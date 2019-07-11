FROM larsklitzke/alpine-python3.5-llvm7
MAINTAINER Lars Klitzke <Lars.Klitzke@gmail.com>

# add mysql
RUN apk update && \
	apk --no-cache add mysql mysql-client && \
	addgroup mysql mysql

# update pip
RUN pip install -U pip

# Upgrade setuptools and install some python packages
RUN pip3 install --no-cache-dir -U \
    setuptools
