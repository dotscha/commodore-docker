FROM debian:buster-slim

RUN apt-get update &&   \
  apt-get install -y    \ 
	git gcc g++ scons   \
	libfltk1.3-dev      \
	portaudio19-dev     \
	libsndfile1-dev     \
	libsdl-dev          \
	liblua5.3-dev

RUN mkdir /home/dev
WORKDIR /home/dev

RUN git clone http://github.com/istvan-v/plus4emu
WORKDIR /home/dev/plus4emu

RUN scons -j 4 && scons install

ENV HOME="/root"
ENV PATH="$HOME/bin:${PATH}"

WORKDIR /root
