# Minimal Docker image for rammap + samtools using rammap image base
FROM niemasd/rammap:1.0.0
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install samtools
RUN apk update && \
    apk add bash bzip2-dev xz-dev && \
    wget -qO- "https://github.com/samtools/samtools/releases/download/1.23.1/samtools-1.23.1.tar.bz2" | tar -xj && \
    cd samtools-* && \
    ./configure --without-curses && \
    make && \
    make install && \
    cd .. && \
    rm -rf samtools-*
