#!/bin/sh

# For an AWS P3 instance with the machine learning base AMI

sudo nvidia-smi -ac 877,1530
sudo yum install -y cmake3 devtoolset-4-gcc* hwloc-devel libmicrohttpd-devel openssl-devel make git gcc64 gcc64-c++ htop
git clone https://github.com/jamwaffles/xmr-stak.git
cd xmr-stak
git checkout dev
cmake3 . -DCUDA_ENABLE=ON -DCUDA_ARCH=70 -DCPU_ENABLE=ON -DHWLOC_ENABLE=ON -DXMR-STAK_CURRENCY=monero -DCMAKE_BUILD_TYPE=release -DOpenCL_ENABLE=OFF
make install