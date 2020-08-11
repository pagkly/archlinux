FROM base/archlinux

# Locale settings
RUN pacman -Sy --noconfirm \
        sed \
        gzip \
        grep \
        awk \
        which \
        patch \
        git \
        curl \
        tar \
        x11vnc \
        python3 python python-pip idle \
        gnome gnome-extra gnome-shell \
        && \
    echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen; locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Download and install NVIDIA CUDA
# curl -o nvidia-install http://us.download.nvidia.com/XFree86/Linux-x86_64/375.66/NVIDIA-Linux-x86_64-375.66.run && \
RUN mkdir -p /nvidia/build && \
    cd /nvidia/build/ && \
    curl -o nvidia-install https://us.download.nvidia.com/XFree86/Linux-x86_64/450.57/NVIDIA-Linux-x86_64-450.57.run && \
    chmod +x nvidia-install && \
    /nvidia/build/nvidia-install -s -N --no-kernel-module && \
    rm -r /nvidia/

#
# Install cuda from reqo
# Dependencies are skipped to avoid installing of nvidia driver
#
RUN pacman -S --noconfirm -dd \
                    cuda \
                    gcc5 \
                    libmpc \
                    binutils && \
    pacman -Scc --noconfirm

ENV PATH=$PATH:/opt/cuda/bin

RUN echo "exec xfce4-session" | tee /root/.xinitrc
CMD nvidia-smi
