FROM ubuntu:20.04

# Set non-interactive mode
ENV DEBIAN_FRONTEND noninteractive

# Install necessary packages
RUN apt-get update \
    && apt-get install -y \
        openjdk-11-jdk \
        maven \
        git \
        openssh-server \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create Jenkins user
RUN useradd -m -s /bin/bash jenkins \
    && echo "jenkins:jenkins" | chpasswd

# Allow Jenkins user to run sudo without password
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Configure SSH
RUN mkdir /var/run/sshd

# Expose SSH port
EXPOSE 22

# Start SSH daemon
CMD ["/usr/sbin/sshd", "-D"]
