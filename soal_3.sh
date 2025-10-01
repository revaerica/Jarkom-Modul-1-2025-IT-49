#Konfigurasi Eru
auto eth1
iface eth1 inet static
	address 10.88.1.1
	netmask 255.255.255.0

auto eth2
iface eth2 inet static
	address 10.88.2.1
	netmask 255.255.255.0
#Konfigurasi Melkor
auto eth0
iface eth0 inet static
	address 10.88.1.2
	netmask 255.255.255.0
	gateway 10.88.1.1
#Konfigurasi Manwe
auto eth0
iface eth0 inet static
	address 10.88.1.3
	netmask 255.255.255.0
	gateway 10.88.1.1
#Konfigurasi Valda
auto eth0
iface eth0 inet static
	address 10.88.2.2
	netmask 255.255.255.0
	gateway 10.88.2.1
#Konfigurasi Ulmo
auto eth0
iface eth0 inet static
	address 10.88.2.3
	netmask 255.255.255.0
	gateway 10.88.2.1
