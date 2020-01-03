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