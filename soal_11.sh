# Di Melkor
apt update
apt-get install telnetd xinetd -y

cat << EOF > /etc/xinetd.d/telnet
service telnet
{
    disable         = no
    flags           = REUSE
    socket_type     = stream
    wait            = no
    user            = root
    server          = /usr/sbin/in.telnetd
    log_on_failure  += USERID
}
EOF

service xinetd restart

useradd -m -d /home/test -s /bin/bash test
echo "test:test123" | chpasswd

# Di Eru
apt update
apt-get install telnetd xinetd -y

telnet 10.88.1.2
