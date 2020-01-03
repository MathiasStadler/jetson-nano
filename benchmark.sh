#!/bin/bash

# from here
# https://devtalk.nvidia.com/default/topic/1050377/jetson-nano/deep-learning-inference-benchmarking-instructions/


cd 
cd ~/Downloads/
wget --no-check-certificate 'https://nvidia.box.com/shared/static/8oqvmd79llr6lq1fr43s4fu1ph37v8nt.gz' -O ssd-mobilenet-v2.tar.gz
tar -xvf ssd-mobilenet-v2.tar.gz
cd ssd-mobilenet-v2
sudo cp -R sampleUffSSD_rect /usr/src/tensorrt/samples
sudo cp sample_unpruned_mobilenet_v2.uff /usr/src/tensorrt/data/ssd/
sudo cp image1.ppm /usr/src/tensorrt/data/ssd/

sudo sed -i 's/static Logger gLogger/Logger gLogger/g' /usr/src/tensorrt/samples/sampleUffSSD_rect/sampleUffSSD.cpp

cd /usr/src/tensorrt/samples/sampleUffSSD_rect
sudo make -j4

cd /usr/src/tensorrt/bin
sudo ./sample_uff_ssd_rect