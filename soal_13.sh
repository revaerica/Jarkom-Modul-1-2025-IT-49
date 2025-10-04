# Di Eru
apt update
apt-get install -y openssh-server

useradd -m -d /home/erutest -s /bin/bash erutest
echo "erutest:passworderu123" | chpasswd

service ssh restart

ss -tuln | grep :22

# Di varda
ssh erutest@10.88.1.1
