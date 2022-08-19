FROM alpine

# /home/dev
RUN mkdir /home/dev
WORKDIR /home/dev
ENV HOME=/home/dev
RUN mkdir bin tools
ENV PATH="$HOME/bin:${PATH}"

# Utils
# GCC, Pyhton, Perl
# Java
RUN apk update && \
    apk add gzip zip unzip && \
    apk add grep sed gawk util-linux bash && \
    apk add git subversion wget nano vim mc && \
    apk add make gcc g++ python3 && \
    apk add openjdk11 && \
	rm -rf /etc/apk/cache

ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk/
ENV PATH="$JAVA_HOME/bin:${PATH}"

# ASL
RUN mkdir tools/asl && \
    wget http://john.ccac.rwth-aachen.de:8000/ftp/as/source/c_version/asl-current.tar.gz && \
    tar -xzf asl-current.tar.gz && rm asl-current.tar.gz && mv asl-current a && \
    cp a/COPYING a/README a/TODO tools/asl && \
    cp a/Makefile.def-samples/Makefile.def-x86_64-unknown-linux a/Makefile.def && \
    make -C a && \
    cp a/asl a/as.msg a/ioerrs.msg a/cmdarg.msg a/p2bin a/p2bin.msg a/tools.msg $HOME/bin && \
    rm -rf a

# KickAss
COPY Kick*5.23.zip .
RUN mkdir tools/kickass && unzip -d tools/kickass Kick* && rm Kick*.zip && \
    echo "java -jar /home/dev/tools/kickass/KickAss.jar \$@" > bin/kickass && \
    chmod +x bin/kickass

# CC65
WORKDIR /home/dev/tools
RUN git clone https://github.com/cc65/cc65 && make -C cc65 
ENV CC65_INC=/home/dev/tools/cc65/include
ENV LD65_LIB=/home/dev/tools/cc65/lib
ENV LD65_CFG=/home/dev/tools/cc65/cfg
ENV PATH="$HOME/tools/cc65/bin:${PATH}"

# ACME
WORKDIR /home/dev/tools
RUN git clone https://github.com/meonwax/acme.git && \
    make -C acme/src && cp acme/src/acme $HOME/bin && \
    rm -rf acme/src

# 64TASS
WORKDIR /home/dev/tools
RUN svn checkout https://svn.code.sf.net/p/tass64/code/trunk t64 && \
    make -C t64 && cp t64/64tass $HOME/bin && mkdir 64tass && \
    mv t64/README t64/NEWS t64/test t64/syntax t64/LIC* 64tass && \
    rm -rf t64

# DASM
WORKDIR /home/dev
RUN git clone https://github.com/dasm-assembler/dasm.git && \
    make -C dasm && cp dasm/bin/* bin && mkdir -p tools/dasm && \
    mv dasm/ChangeLog dasm/README dasm/LICENSE dasm/NEWS dasm/docs tools/dasm && \ 
    rm -rf dasm

# Exomizer
WORKDIR /home/dev/tools
RUN wget https://bitbucket.org/magli143/exomizer/wiki/downloads/exomizer-3.1.1.zip && \
    wget https://bitbucket.org/magli143/exomizer/wiki/downloads/exomizer-3.0.2.zip && \
    wget https://bitbucket.org/magli143/exomizer/wiki/downloads/exomizer-2.0.11.zip && \
    unzip -d exomizer3.1.1 exomizer-3.1.1.zip && \
    unzip -d exomizer3.0.2 exomizer-3.0.2.zip && \
    unzip -d exomizer2.0.11 exomizer-2.0.11.zip && \
    make -C exomizer3.1.1/src && \
    make -C exomizer3.0.2/src && \
    make -C exomizer2.0.11/src && \
    mv exomizer3.1.1/src/exobasic $HOME/bin && \
    mv exomizer3.1.1/src/exomizer $HOME/bin/exomizer3.1.1 && \
    mv exomizer3.0.2/src/exomizer $HOME/bin/exomizer3.0.2 && \
    mv exomizer2.0.11/src/exomizer $HOME/bin/exomizer2.0.11 && \
    rm -rf exom*/src exom*/win32 exom*.zip && \
    ln -s $HOME/bin/exomizer2.0.11 $HOME/bin/exomizer2 && \
    ln -s $HOME/bin/exomizer3.1.1 $HOME/bin/exomizer3 && \
    ln -s $HOME/tools/exomizer3.1.1 $HOME/tools/exomizer-latest

# Krill's loader v184
WORKDIR /home/dev/tools/
COPY loader-v184.zip loader.zip
RUN unzip -d krill-v184 loader.zip && rm loader.zip && \
    make -C krill*/loader/tools/cc1541 && \
    mv krill*/loader/tools/cc1541/cc1541 $HOME/bin && \
    make -C krill*/loader/tools/pucrunch && \
    mv krill*/loader/tools/pucrunch/pucrunch $HOME/bin

# Bitfire+4
RUN git clone https://github.com/dotscha/bitfire.git && \
	make -C bitfire/bitfire bitnax d64write installer.prg installers && \
	mv bitfire/bitfire/bitnax bitfire/bitfire/d64write $HOME/bin

WORKDIR /home/dev

ENV PS1="\e[0;32m[\W] $ \e[m"
CMD /bin/bash
