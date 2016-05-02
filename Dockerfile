FROM 979731122486.dkr.ecr.us-east-1.amazonaws.com/yokai-tools-on-premise:0.14.0a1-gpu-dev

COPY build/torch/lib/ /opt/conda/envs/yexp/lib/python3.7/site-packages/torch/lib/
COPY build/torch/lib/libc10.so /opt/conda/envs/yexp/lib/python3.7/site-packages/torch/lib/
COPY build/torch/lib/libc10_cuda.so /opt/conda/envs/yexp/lib/python3.7/site-packages/torch/lib/
COPY build/torch/lib/libcaffe2_detectron_ops_gpu.so /opt/conda/envs/yexp/lib/python3.7/site-packages/torch/lib/
COPY build/torch/lib/libcaffe2_module_test_dynamic.so /opt/conda/envs/yexp/lib/python3.7/site-packages/torch/lib/
COPY build/torch/lib/libcaffe2_nvrtc.so /opt/conda/envs/yexp/lib/python3.7/site-packages/torch/lib/
COPY build/torch/lib/libcaffe2_observers.so /opt/conda/envs/yexp/lib/python3.7/site-packages/torch/lib/
COPY build/torch/lib/libshm.so /opt/conda/envs/yexp/lib/python3.7/site-packages/torch/lib/
COPY build/torch/lib/libtorch.so /opt/conda/envs/yexp/lib/python3.7/site-packages/torch/lib/
COPY build/torch/lib/libtorch_python.so /opt/conda/envs/yexp/lib/python3.7/site-packages/torch/lib/