#FROM 979731122486.dkr.ecr.us-east-1.amazonaws.com/yokai-tools-on-premise:0.14.0a1-gpu-dev
FROM pytorch/pytorch:1.2-cuda10.0-cudnn7-runtime

COPY build_/lib/libc10.so /opt/conda/lib/python3.6/site-packages/torch/lib/
COPY build_/lib/libc10_cuda.so /opt/conda/lib/python3.6/site-packages/torch/lib/
COPY build_/lib/libcaffe2_detectron_ops_gpu.so /opt/conda/lib/python3.6/site-packages/torch/lib/
COPY build_/lib/libcaffe2_module_test_dynamic.so /opt/conda/lib/python3.6/site-packages/torch/lib/
COPY build_/lib/libcaffe2_nvrtc.so /opt/conda/lib/python3.6/site-packages/torch/lib/
COPY build_/lib/libcaffe2_observers.so /opt/conda/lib/python3.6/site-packages/torch/lib/
COPY build_/lib/libshm.so /opt/conda/lib/python3.6/site-packages/torch/lib/
COPY build_/lib/libtorch.so /opt/conda/lib/python3.6/site-packages/torch/lib/
COPY build_/lib/libtorch_python.so /opt/conda/lib/python3.6/site-packages/torch/lib/

ENV LD_LIBRARY_PATH=/opt/conda/lib/python3.6/site-packages/torch/lib/:/usr/local/nvidia/lib:/usr/local/nvidia/lib64
