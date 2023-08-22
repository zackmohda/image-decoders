FROM ubuntu:lunar

### update
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -q update
RUN apt-get -q -y upgrade

RUN apt-get -q -y install g++ git cmake meson pkg-config equivs sed
RUN apt-get -q -y install zlib1g-dev libpng-dev libjpeg-dev libtiff5-dev libgdk-pixbuf2.0-dev libxml2-dev libsqlite3-dev libcairo2-dev libglib2.0-dev

RUN mkdir /root/src
COPY . /root/src

### openjpeg version in ubuntu 14.04 is 1.3, too old and does not have openslide required chroma subsampled images support.  download 2.5.0 from source and build
WORKDIR /root/src
RUN ./install_openjpeg.sh

### OpenSlide
WORKDIR /root/src
RUN ./install_openslide.sh

## build dummy apt packages
RUN mkdir equivs
RUN cd equivs
ADD libopenslide0 .

# libopenslide0
RUN equivs-build libopenslide0
RUN dpkg -i libopenslide0_3.4.2_all.deb

# libopenslide-dev
RUN sed -i 's/libopenslide0/libopenslide-dev/g' libopenslide0
RUN mv libopenslide0 libopenslide-dev
RUN equivs-build libopenslide-dev
RUN dpkg -i libopenslide-dev_3.4.2_all.deb

WORKDIR /
