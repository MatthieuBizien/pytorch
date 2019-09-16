FROM 979731122486.dkr.ecr.us-east-1.amazonaws.com/yokai-tools-on-premise:0.14.0a1-gpu-dev

COPY build_/lib/libc10.so /opt/conda/envs/yexp/lib/python3.7/site-packages/torch/lib/
COPY build_/lib/libc10_cuda.so /opt/conda/envs/yexp/lib/python3.7/site-packages/torch/lib/
COPY build_/lib/libcaffe2_detectron_ops_gpu.so /opt/conda/envs/yexp/lib/python3.7/site-packages/torch/lib/
COPY build_/lib/libcaffe2_module_test_dynamic.so /opt/conda/envs/yexp/lib/python3.7/site-packages/torch/lib/
COPY build_/lib/libcaffe2_nvrtc.so /opt/conda/envs/yexp/lib/python3.7/site-packages/torch/lib/
COPY build_/lib/libcaffe2_observers.so /opt/conda/envs/yexp/lib/python3.7/site-packages/torch/lib/
COPY build_/lib/libshm.so /opt/conda/envs/yexp/lib/python3.7/site-packages/torch/lib/
COPY build_/lib/libtorch.so /opt/conda/envs/yexp/lib/python3.7/site-packages/torch/lib/
COPY build_/lib/libtorch_python.so /opt/conda/envs/yexp/lib/python3.7/site-packages/torch/lib/
