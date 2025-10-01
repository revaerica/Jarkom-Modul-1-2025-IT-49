#root@Eru
apt update && apt install iptables && iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.88.0.0/16
#root@[Setiap Client]
echo nameserver 192.168.122.1 > /etc/resolv.conf
