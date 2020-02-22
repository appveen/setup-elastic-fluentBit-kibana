#!/bin/sh
echo "**************************************"
echo "starting fluent-bit local installation"
echo "**************************************"
sudo apt-get update && sudo apt-get install build-essential
sudo apt install cmake
sudo wget https://fluentbit.io/releases/1.0/fluent-bit-1.0.6.tar.gz
sudo tar -xvf fluent-bit-1.0.6.tar.gz
cd fluent-bit-1.0.6
cd build
sudo cmake ../
sudo make
sudo make install
cd ..
sudo rm /usr/local/etc/fluent-bit/fluent-bit.conf
sudo cp fluent-bit.conf /usr/local/etc/fluent-bit
sudo systemctl start fluent-bit 
echo "**************************************"
echo "fluent-bit installed locally on system"
echo "***************************************"
