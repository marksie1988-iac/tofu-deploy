# Use an official base image
FROM ubuntu:22.04

# Install necessary packages and dependencies
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /var/automation

# Install the latest OpenTofu
RUN curl -sL $(curl -s https://api.github.com/repos/opentofu/opentofu/releases/latest | grep "browser_download_url.*linux_amd64.zip" | cut -d '"' -f 4) \
    -o opentofu.zip \
    && unzip opentofu.zip -d /usr/local/bin/ \
    && chmod +x /usr/local/bin/tofu \
    && rm opentofu.zip

# Set the working directory
WORKDIR /workspace

# Set the entrypoint (optional)
ENTRYPOINT ["/bin/bash"]
