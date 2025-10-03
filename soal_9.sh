apt update
apt install wget
apt install unzip -y 
apt install vsftpd -y
apt install ftp -y

wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=11ua2KgBu3MnHEIjhBnzqqv2RMEiJsILY' -O kitab_penciptaan.zip

unzip kitab_penciptaan.zip

mv kitab_penciptaan.txt /srv/ftp/shared/
chown ainur:ainur /srv/ftp/shared/kitab_penciptaan.txt
chmod 644 /srv/ftp/shared/kitab_penciptaan.txt 

#ubah config
nano /etc/vsftpd_user_conf/ainur
``
write_enable=NO
local_root=/srv/ftp
``

#Di manwe
ping 10.88.1.1 

ftp 10.88.1.1 
ftp> ls
ftp> cd shared
ftp> ls
ftp> get kitab_penciptaan.txt

ls -lh kitab_penciptaan.txt
cat kitab_penciptaan.txt
