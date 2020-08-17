# Docker Archlinux CUDA Gnome

Installed Versions:
* NVIDIA Driver (manual install)
* CUDA 

**IMPORTANT**: Host driver version must match exactly
## Install
#### Linux
```
sudo apt-get update
sudo apt-get install -y git
# sudo pacman -S --noconfirm yay pamac
# yay -S --noconfirm git
sudo rm -rf ~/dockerarchcuda
cd ~
git clone https://github.com/pagkly/dockerarchcuda
cd ./dockerarchcuda
sudo docker build -t dockerarchcuda .
```
#### Windows 10
```
cd $env:USERPROFILE
rmdir /S /Q dockerarchcuda
git clone https://github.com/pagkly/dockerarchcuda
cd dockerarchcuda
docker build -t dockerarchcuda .
```

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
