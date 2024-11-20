FROM ubuntu:latest AS base

FROM base AS juce_dev_machine

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    git \
    clang \
    cmake \
    ninja-build \
    pkg-config \
    openssh-client \
    libjack-jackd2-dev \
    ladspa-sdk \
    libcurl4-openssl-dev  \
    libfreetype6-dev \
    libx11-dev  \
    libxcomposite-dev  \
    libxcursor-dev  \
    libxcursor-dev  \
    libxext-dev  \
    libxinerama-dev  \
    libxrandr-dev \
    libxrender-dev \
    libwebkit2gtk-4.1-dev \
    libglu1-mesa-dev  \
    mesa-common-dev

#Make sure clang is the default compiler:
RUN DEBIAN_FRONTEND=noninteractive \
    update-alternatives --install /usr/bin/cc cc /usr/bin/clang 100

RUN DEBIAN_FRONTEND=noninteractive \
    update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang 100