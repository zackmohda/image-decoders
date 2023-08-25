# To see where, if it fails
set -x
set -e

## BioFormats

mkdir bioformats
cd bioformats

# URL from: https://downloads.openmicroscopy.org/bio-formats/7.0.0/artifacts/
wget -q https://downloads.openmicroscopy.org/bio-formats/7.0.0/artifacts/bioformats_package.jar -O bioformats_all_in_one_compressed.jar

# uncompress early and store without compression for performance
unzip -q bioformats_all_in_one_compressed.jar -d temp
cd temp
zip -0 -q -r ../bioformats_all_in_one.jar *
cd ..
rm -r temp
rm bioformats_all_in_one_compressed.jar

# to verify jar contents, you may do:
# jar tvf ../jar_files/bioformats_all_in_one.jar

## Move them to a single directory
mv /root/src/image-decoders/bioformats/* /usr/lib/java

#### Missing optimization: Packing our Jar and BioFormats Jar to a single Jar
