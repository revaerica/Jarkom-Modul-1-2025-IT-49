# Jarkom-Modul-1-2025-IT-49

### Nama Anggota
1. Revalina Erica Permatasari (5027241007)
2. Muhammad Rafi' Adly (5027241082)

## Soal 1
Menggunakan GNS3 Web UI dengan IP Address Host-nya 10.15.43.32. Membuat project dengan Eru sebagai Router-nya yang terhubung ke internet(NAT1), juga terhubung ke 2 gateway/switch. Yang gateway masing-masing tersebut terhubung ke 2 client seperti pada gambar.
<img width="1920" height="1128" alt="image" src="https://github.com/user-attachments/assets/393ae44f-f9f8-4ca4-9358-905033c31d38" />

## Soal 2
Seperti yang dijelaskan sebelumnya, Eru (Router) terhubung ke NAT1 (Internet). Kemudian edit konfigurasinya agar Eru tersambung ke NAT1 dan memiliki IP dinamis.
```
auto eth0
iface eth0 inet dhcp
```

## Soal 3
Untuk memastikan Eru terhubung ke gateway, kami menambahkan konfigurasinya sebagai berikut.
```
auto eth1
iface eth1 inet static
	address 10.88.1.1
	netmask 255.255.255.0

auto eth2
iface eth2 inet static
	address 10.88.2.1
	netmask 255.255.255.0
```
IP Gateway untuk Switch 1 adalah 10.88.1.1, Switch 2 adalah 10.88.2.1. Kemudian setiap client memiliki IP Statis dan konfigurasinya sebagai berikut.
**Switch 1**
Client Melkor dengan IP Address 10.88.1.2.
```
auto eth0
iface eth0 inet static
	address 10.88.1.2
	netmask 255.255.255.0
	gateway 10.88.1.1
```
Client Manwe dengan IP Address 10.88.1.3.
```
auto eth0
iface eth0 inet static
	address 10.88.1.3
	netmask 255.255.255.0
	gateway 10.88.1.1
```
**Switch 2**
Client Varda dengan IP Address 10.88.2.2.
```
auto eth0
iface eth0 inet static
	address 10.88.2.2
	netmask 255.255.255.0
	gateway 10.88.2.1
```
Client Ulmo dengan IP Address 10.88.2.3.
```
auto eth0
iface eth0 inet static
	address 10.88.2.3
	netmask 255.255.255.0
	gateway 10.88.2.1
```

## Soal 4
Agar semua client dapat terhubung ke internet, pertama-tama menginstall `iptables` dan menjalankan command `iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.88.0.0/16` pada router Eru.
<img width="1920" height="1128" alt="image" src="https://github.com/user-attachments/assets/2b1c2fcf-690e-46c2-a690-129d73329dad" />
Kemudian menyesuaikan file resolv.conf pada directory setiap client agar memiliki DNS yang sama seperti Router Eru.
<img width="494" height="50" alt="image" src="https://github.com/user-attachments/assets/f2e03673-73f8-4bf6-a102-0e62a8ca0a57" />
Dengan menjalankan command `echo nameserver 192.168.122.1 > /etc/resolv.conf` pada setiap client. Berikut adalah salah satu node client yang sudah bisa melakukan ping pada google.
<img width="1291" height="354" alt="image" src="https://github.com/user-attachments/assets/d781a2d3-8b1b-4089-bf78-24b597e534cb" />

## Soal 5
Pada konfigurasi Eru ditambahkan startup script `up apt update && apt install iptables && iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.88.0.0/16`. Dan setiap dari konfigurasi client ditambahkan `up echo nameserver 192.168.122.1 > /etc/resolv.conf` untuk startup script-nya.
