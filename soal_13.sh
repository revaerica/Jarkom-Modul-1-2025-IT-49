# Di Eru
apt update
apt-get install -y openssh-server

service ssh restart

ss -tuln | grep :22

# Di varda
ssh test@10.88.1.1
