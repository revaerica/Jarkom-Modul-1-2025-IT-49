apt update
apt install wget
apt install unzip -y 
apt install vsftpd -y
apt install ftp -y

wget --no-check-certificate "https://drive.usercontent.google.com/u/0/uc?id=11ra_yTV_adsPIXeIPMSt0vrxCBZu0r33&export=download" -O cuaca.zip

unzip cuaca.zip

service vsftpd start

ftp 10.88.2.1
ftp> cd shared
ftp> put cuaca.txt
ftp> put mendung.jpg

# "sebelum itu buka dulu wireshark di kabel"
