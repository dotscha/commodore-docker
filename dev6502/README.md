# dev6502

Docker image for 6502 development, mainly for commodore machines.

## Run

This will mount your current directory as /home/dev/src and give you a prompt there:

```
$ docker run -it --rm -v `pwd`:/home/dev/src -w /home/dev/src adotsch/dev6502
```

## Contents

* High-level languages 
    * C (GCC)
    * C++ (G++)
    * Java (OpenJDK11)
    * Python 3

* Assembly compilers
    * ASL (Bld 228)
    * KickAss 5.23
    * CC65
    * ACME
    * 64TASS
    * DASM

* Loaders
    * Krill's Loader v184
    * Bitfire+4

* Utils
    * Exomizer 2.0.11, 3.0.2, 3.1.1
    * PuCrunch
    * cc1541

* Other untils
    * make
    * nano, vim, mc
    * grep, sed, awk
    * git, subversion, wget
    * zip, unzip, gzip
