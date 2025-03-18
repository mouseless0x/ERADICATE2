FROM --platform=linux/amd64 nvidia/opencl:devel-ubuntu18.04

# Set non-interactive mode for apt
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    build-essential \
    git \
    pkg-config \
    libssl-dev \
    ocl-icd-opencl-dev \
    opencl-headers \
    libcurl4-openssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Create app directory
WORKDIR /app

# Copy source files
COPY . .

# Copy init code files
COPY v6.txt v7.txt /app/

# Build the application
RUN make

