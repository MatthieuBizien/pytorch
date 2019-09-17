# syntax=docker/dockerfile:experimental
FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu16.04
ARG PYTHON_VERSION=3.6
RUN apt-get update && apt-get install -y --no-install-recommends \
         build-essential \
         cmake \
         git \
         curl \
         ca-certificates \
         libjpeg-dev \
         libpng-dev && \
     rm -rf /var/lib/apt/lists/*


RUN curl -o ~/miniconda.sh -O  https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh  && \
     chmod +x ~/miniconda.sh && \
     ~/miniconda.sh -b -p /opt/conda && \
     rm ~/miniconda.sh && \
     /opt/conda/bin/conda install -y python=$PYTHON_VERSION numpy pyyaml scipy ipython mkl mkl-include ninja cython typing && \
     /opt/conda/bin/conda install -y -c pytorch magma-cuda100 && \
     /opt/conda/bin/conda clean -ya
ENV PATH /opt/conda/bin:$PATH

ENV CCACHE_DIR=/ccache
RUN apt-get update && apt-get install -y --no-install-recommends autoconf gperf asciidoc xsltproc && \
     rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/ccache/ccache.git && \
    cd ccache && \
    git checkout 7abac8f && \
    ./autogen.sh && \
    ./configure && \
    make install prefix=/usr/local/bin && \
    for p in gcc g++ cc c++ nvcc; do ln -vs /usr/local/bin/ccache /usr/local/bin/$p;  done

# This must be done before pip so that requirements.txt is available
WORKDIR /opt/pytorch
COPY . .

RUN git submodule update --init --recursive
RUN --mount=type=cache,target=/ccache/ \
    TORCH_CUDA_ARCH_LIST="6.0 6.1 7.0 7.5" TORCH_NVCC_FLAGS="-Xfatbin -compress-all" \
    CMAKE_PREFIX_PATH="$(dirname $(which conda))/../" \
    pip install -v .

RUN git clone https://github.com/pytorch/vision.git && cd vision && git checkout v0.4.0 && pip install -v .

WORKDIR /workspace
RUN chmod -R a+w .
