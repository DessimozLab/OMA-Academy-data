FROM mcr.microsoft.com/devcontainers/base:ubuntu

WORKDIR /workspaces

# system tools
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    unzip \
    git \
    && rm -rf /var/lib/apt/lists/*

# install Miniforge
RUN curl -L -O "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh" \
 && bash Miniforge3-Linux-x86_64.sh -b -p /opt/conda \
 && rm Miniforge3-Linux-x86_64.sh

ENV PATH="/opt/conda/bin:$PATH"

# create conda env
RUN mamba create -n omacademy -c conda-forge python=3.9 -y

# install bioinformatics tools
RUN mamba install -n omacademy -c bioconda \
    mafft \
    fasttree \
    iqtree \
    nextflow \
    -y \
 && mamba install -n omacademy -c conda-forge openjdk -y

# python tools
RUN /opt/conda/envs/omacademy/bin/pip install pyham

# activate env by default
RUN echo "source /opt/conda/etc/profile.d/conda.sh" >> /etc/bash.bashrc \
 && echo "conda activate omacademy" >> /etc/bash.bashrc
