#!/bin/bash -e

# sudo apt-get install imagemagick -y

sudo apt-get remove imagemagick

mkdir ~/src

cd ~/src

wget https://www.imagemagick.org/download/releases/ImageMagick-6.8.9-10.tar.xz

sudo apt-get -y install build-essential checkinstall

sudo apt-get -y build-dep imagemagick


tar xf ImageMagick-6.8.9-10.tar.xz

cd ImageMagick-6*

./configure

make

sudo make install

sudo ldconfig /usr/local/lib

echo `identify -version`
