# jetson-nano hints

## install tf

[Install tf](https://docs.nvidia.com/deeplearning/frameworks/install-tf-jetson-platform/index.html#troubleshooting)

## install notebook

- [from here](https://github.com/NVIDIA-AI-IOT/jetbot/wiki/Create-SD-Card-Image-From-Scratch)

```bash
sudo apt install nodejs
# detour from here https://askubuntu.com/questions/1088662/npm-depends-node-gyp-0-10-9-but-it-is-not-going-to-be-installed
sudo apt-get install nodejs-dev node-gyp libssl1.0-dev
sudo apt install  npm
sudo jupyter labextension install @jupyter-widgets/jupyterlab-manager
# throw error sudo jupyter labextension install @jupyterlab/statusbar
sudo -S pip3 install -U jupyter jupyterlab
jupyter lab --generate-config
jupyter notebook password
```

## tf tutorial

```txt
https://github.com/aymericdamien/TensorFlow-Examples
https://github.com/NVIDIA-AI-IOT/jetbot/wiki/third-party-kits
```
## Benchmark

```txt
https://devtalk.nvidia.com/default/topic/1050377/jetson-nano/deep-learning-inference-benchmarking-instructions/
```


## NVIDIA TenserRT for jetson 

https://docs.nvidia.com/deeplearning/sdk/tensorrt-developer-guide/index.html


## jetson memory
https://docs.nvidia.com/cuda/cuda-for-tegra-appnote/index.html#effective-usage-unified-memory

## cuda tutorial
https://jhui.github.io/2017/03/06/CUDA/

## cuda reference
http://www.icl.utk.edu/~mgates3/docs/cuda.html

## um
nvprof --unified-memory-profiling per-process-device ./test1

## nvprof trace
nvprof --print-gpu-trace ./unified_64align.out


## gencode
nvcc -m 64 --resource-usage -gencode arch=compute_53,code=sm_53 -I/usr/local/cuda-10.0/samples/common/inc -o sgemm ./sgemm.cu

## kurs in deutsch
https://git.informatik.tu-freiberg.de/reinhar2/parallelrechner2019/tree/master/05_0_CUDA_1
