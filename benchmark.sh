#!/bin/bash

# from here
# https://devtalk.nvidia.com/default/topic/1050377/jetson-nano/deep-learning-inference-benchmarking-instructions/

echo " Downalod all file from https://drive.google.com/drive/folders/1wbp6SBQA6PS0JrbK5bw_kHLXo23a0D7x first"
read

echo " add from here "
echo "https://drive.google.com/drive/folders/1-eS14TKWACWEaOirSDeetLjIU0h8uOfv"

read


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


sudo cp ~/Downloads/ResNet50_224x224.prototxt  /usr/src/tensorrt/data/googlenet
sudo cp ~/Downloads/inception_v4.prototxt  /usr/src/tensorrt/data/googlenet
sudo cp ~/Downloads/pose_estimation.prototxt  /usr/src/tensorrt/data/googlenet
sudo cp ~/Downloads/vgg19_N2.prototxt  /usr/src/tensorrt/data/googlenet

cd /usr/src/tensorrt/bin
./trtexec --output=prob --deploy=../data/googlenet/ResNet50_224x224.prototxt --fp16 --batch=1

cd /usr/src/tensorrt/bin
./trtexec --output=prob --deploy=../data/googlenet/inception_v4.prototxt --fp16 --batch=1

cd /usr/src/tensorrt/bin
./trtexec --output=prob --deploy=../data/googlenet/VGG19_N2.prototxt --fp16 --batch=1

sudo cp ~/Downloads/output_graph.uff /usr/src/tensorrt/data/googlenet 

cd /usr/src/tensorrt/bin
sudo ./trtexec --uff=~/output_graph.uff --uffInput=input_1,1,512,512 --output=conv2d_19/Sigmoid --fp16


sudo cp ~/Downloads/pose_estimation.prototxt /usr/src/tensorrt/data/googlenet 

cd /usr/src/tensorrt/bin/
sudo ./trtexec --output=Mconv7_stage2_L2 --deploy=../data/googlenet/pose_estimation.prototxt --fp16 --batch=1

