docker run -it --rm -e DISPLAY=host.docker.internal:0.0 -v `pwd`:/root/files --net=host adotsch/plus4emu $@
