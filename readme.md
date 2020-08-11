# Docker Archlinux CUDA Gnome

Installed Versions:
* NVIDIA Driver (manual install)
* CUDA 

**IMPORTANT**: Host driver version must match exactly
## Install
git clone https://github.com/pagkly/archlinux
cd ./archlinux
sudo docker build -t archlinux .

## Run
RUN container as root with vnc @ 1024x768:
```
sudo docker run -it --user 0 --restart=always -d -p 5900 --privileged --cap-add SYS_ADMIN --cap-add DAC_READ_SEARCH --security-opt seccomp=unconfined archlinux sudo su -c "x11vnc -forever -create -scale 1024x768"
```

## Run VNC
```
sudo apt-get install -y vncviewer
vncviewer :port
```
