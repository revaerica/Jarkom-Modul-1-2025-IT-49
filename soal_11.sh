# Di Melkor
apt-get update
apt-get install -y telnetd inetutils-telnetd openbsd-inetd

useradd -m -d /home/test -s /bin/bash test
echo "test:test123" | chpasswd

sed -i '/telnet/d' /etc/inetd.conf
echo "telnet stream tcp nowait root /usr/sbin/in.telnetd /usr/sbin/login" >> /etc/inetd.conf

service openbsd-inetd restart

ss -tuln | grep :23

# Di Eru
apt-get update
apt-get install -y telnet 
apt install netcat-traditional -y

telnet 10.88.1.2 

# Pemindaian Port
# Di Eru

apt-get install netcat -y 

echo "--- Port 21 (FTP): ---"
nc -v -z 10.88.1.2 21

echo "--- Port 80 (HTTP): ---"
nc -v -z 10.88.1.2 80

echo "--- Port 666 (Rahasia): ---"
nc -v -z 10.88.1.2 666

# Di Varda
apt-get install -y ssh
ssh test@10.88.1.1 

# Start capture di Wirshark
