# Plus4Emu in Docker

This repo has dockerfiles to build and run Plus4Emu from a Docker container.

## Why?

Because you can't always install everything you want.

## Pre-Flight

 * Docker
 * X Server running
   * Linux: you likely have one
   * Windows: try [VcXsrv Windows X Server](https://sourceforge.net/projects/vcxsrv/)
 
## Run

This works on Windows in WSL (see x.sh):
```
$ docker run -it --rm -e DISPLAY=host.docker.internal:0.0 -v `pwd`:/root/files --net=host adotsch/plus4emu [optional command]
```
Or this in CMD or PowerShell:
```
> docker run -it --rm -e DISPLAY=host.docker.internal:0.0 -v <your path>:/root/files --net=host adotsch/plus4emu [optional command]
```

If no command given it will mount your current folder as /root/files and give you a command prompt where you can run p4compress, p4fliconv, p4sconv or plus4emu directly:
```
root@docker-desktop:~# plus4emu -prg files/demo.prg &
```
## Build

The mk.sh script builds the docker image, you don't have to run this unless you want to modify something.

First it builds an image for compiling plus4emu from latest source code using dev libs.

When that's done all the important files are packed into a tar file and a second smaller image is build with only the neccesar dependencies and the compiled plus4emu.

## Issues

 * no audio yet, but [this might help](https://arnav.jain.se/2020/enable-audio--video-in-docker-container/)
