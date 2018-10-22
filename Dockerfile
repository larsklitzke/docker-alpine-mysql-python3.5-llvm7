# use the latest mysql version
FROM mysql:latest

# Add the python sources
ADD Python-3.5.6.tgz .

# install dependencies
RUN apt-get update && apt-get install -y build-essential\
                                        libncursesw5-dev\
                                        libssl-dev\
                                        libgdbm-dev\
                                        libc6-dev\
                                        libsqlite3-dev\
                                        tk-dev\
                                        libbz2-dev

# build and install python
RUN  cd Python-3.5.6 && \
            ./configure\
                --enable-loadable-sqlite-extensions \
                --enable-shared \
                --with-lto \
                --enable-optimizations \
                --with-system-expat \
                --with-system-ffi \
                --enable-ipv6 --with-threads --with-pydebug --disable-rpath && \
            make -j install
