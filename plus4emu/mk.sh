docker build -f Dockerfile.mk -t p4e .
docker run -it --rm -v `pwd`:/root/files p4e tar czf files/p4e.tar .local .plus4emu bin
docker rmi p4e
docker build -f Dockerfile.run -t adotsch/plus4emu .

