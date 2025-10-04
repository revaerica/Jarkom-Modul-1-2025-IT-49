# Di Eru
apt-get update
apt install netcat-traditional -y

# Di Melkor
apt update
apt install vsftpd -y 
apt install nginx -y 

service vsftpd start
service nginx start

sed -i '/telnet/d' /etc/inetd.conf
echo "telnet stream tcp nowait root /usr/sbin/in.telnetd /usr/sbin/in.telnetd -L /bin/login" >> /etc/inetd.conf

service openbsd-inetd restart

# Di Eru
echo "--- Memeriksa Port 21 (FTP) ---"
nc.traditional -v -z 10.88.1.2 21

echo "--- Memeriksa Port 80 (HTTP) ---"
nc.traditional -v -z 10.88.1.2 80

echo "--- Memeriksa Port Rahasia 666 ---"
nc.traditional -v -z 10.88.1.2 666
