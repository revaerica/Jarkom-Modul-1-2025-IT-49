apt update
apt install wget

wget --no-check-certificate "https://drive.google.com/file/d/1bE3kF1Nclw0VyKq4bL2VtOOt53IC7lG5&export=download" traffic.zip

unzip traffic.zip

chmod +x traffic.sh

 ./traffic.sh

 ping 10.88.1.1
