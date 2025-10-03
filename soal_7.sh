groupadd ainur
useradd -g ainur ainur 
groupadd melkor
useradd -g melkor melkor

# 1. Direktori FTP
mkdir -p /srv/ftp/shared
chown ainur:ainur /srv/ftp/shared
chmod 755 /srv/ftp/shared
# /srv/ftp/shared untuk Ainur read/write

# 2. User Setup
# Ainur (bisa read/write)
usermod -s /bin/bash ainur
passwd ainur

# Melkor (login tapi tidak bisa akses shared)
usermod -s /bin/bash melkor
passwd melkor

# 3. vsftpd Main Config (`/etc/vsftpd.conf`)
listen=YES
listen_ipv6=NO
anonymous_enable=NO

local_enable=YES
write_enable=YES
chroot_local_user=YES
allow_writeable_chroot=YES

dirmessage_enable=YES
use_localtime=YES
xferlog_enable=YES
connect_from_port_20=YES
secure_chroot_dir=/var/run/vsftpd/empty

pasv_enable=YES
pasv_promiscuous=YES

ssl_enable=NO

user_config_dir=/etc/vsftpd_user_conf

# 4. Per-User Config

mkdir -p /etc/vsftpd_user_conf

# Ainur (`/etc/vsftpd_user_conf/ainur`)
write_enable=YES
local_root=/srv/ftp

# Melkor (`/etc/vsftpd_user_conf/melkor`)
write_enable=NO
local_root=/home/melkor
# Pastikan direktori /home/melkor ada:
mkdir -p /home/melkor
chown melkor:melkor /home/melkor
chmod 700 /home/melkor

# 5. File Bukti Akses Ainur
echo "Ini bukti akses FTP Ainur" > /srv/ftp/shared/proof.txt
chown ainur:ainur /srv/ftp/shared/proof.txt
chmod 644 /srv/ftp/shared/proof.txt

# 6. Restart vsftpd
service vsftpd restart

# Ainur
ftp localhost
ls
get proof.txt
put proof.txt
# Bisa read & write.

# Melkor
ftp localhost
ls /srv/ftp/shared 
get /srv/ftp/shared/proof.txt  
put proof.txt  
# Bisa login tapi tidak bisa akses shared.
