FROM --platform=linux/amd64 ubuntu:20.04

# Set non-interactive mode for apt
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    g++ \
    make \
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

# Set the entrypoint
ENTRYPOINT ["./ERADICATE2.x64"]
CMD ["--help"]
