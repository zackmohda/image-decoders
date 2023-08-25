# To see where, if it fails
set -x
set -e

git clone https://github.com/uclouvain/openjpeg.git --branch=v2.5.0 --depth=1
mkdir /root/src/image-decoders/openjpeg/build
cd /root/src/image-decoders/openjpeg/build
cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release -DBUILD_CODEC=ON -DBUILD_PKGCONFIG_FILES=ON -DBUILD_JAVA=OFF -DBUILD_JPIP=OFF ../
make
make install
