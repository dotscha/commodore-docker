FROM alpine

RUN apk update && \
	apk add git gcc g++ scons	\
	fltk-dev fltk-fluid \
	portaudio-dev \
	libsndfile-dev \
	sdl-dev \
	lua5.3-dev

RUN mkdir /home/dev
WORKDIR /home/dev

RUN git clone http://github.com/istvan-v/plus4emu
WORKDIR /home/dev/plus4emu

RUN scons -j 4 && scons install

ENV HOME="/root"
ENV PATH="$HOME/bin:${PATH}"

WORKDIR /root
