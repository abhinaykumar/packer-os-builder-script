#!/bin/bash -e

sudo apt-get -y install checkinstall
sudo apt-get -y build-dep imagemagick

wget https://www.imagemagick.org/download/ImageMagick.tar.gz

tar xf ImageMagick.tar.gz

cd ImageMagick-7*

./configure

make

sudo make install

sudo ldconfig /usr/local/lib

echo `identify -version`

make check
