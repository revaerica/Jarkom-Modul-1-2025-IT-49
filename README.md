# Jarkom-Modul-1-2025-IT-49

### Nama Anggota
1. Revalina Erica Permatasari (5027241007)
2. Muhammad Rafi' Adly (5027241082)

## Soal 1
Menggunakan GNS3 Web UI dengan IP Address Host-nya 10.15.43.32. Membuat project dengan Eru sebagai Router-nya yang terhubung ke internet(NAT1), juga terhubung ke 2 gateway/switch. Dimana masing-masing gateway tersebut terhubung ke 2 client seperti pada gambar.
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

up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.88.0.0/16
```
IP Gateway untuk Switch 1 adalah 10.88.1.1, Switch 2 adalah 10.88.2.1. Kemudian setiap client memiliki IP Statis dan konfigurasinya sebagai berikut.

- Switch 1

Client **Melkor** dengan IP Address 10.88.1.2.
```
auto eth0
iface eth0 inet static
	address 10.88.1.2
	netmask 255.255.255.0
	gateway 10.88.1.1
```
Client **Manwe** dengan IP Address 10.88.1.3.
```
auto eth0
iface eth0 inet static
	address 10.88.1.3
	netmask 255.255.255.0
	gateway 10.88.1.1
```

- Switch 2

Client **Varda** dengan IP Address 10.88.2.2.
```
auto eth0
iface eth0 inet static
	address 10.88.2.2
	netmask 255.255.255.0
	gateway 10.88.2.1
```
Client **Ulmo** dengan IP Address 10.88.2.3.
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

## Soal 6

<img width="863" height="470" alt="image" src="https://github.com/user-attachments/assets/054e4b7b-a9af-4d0b-b6d8-d17939a03841" />

Kita dapat melakukan start capture dan menjalankan ` ./traffic.sh` dan melakukan ping ke IP Eru (10.88.1.1)

<img width="959" height="410" alt="image" src="https://github.com/user-attachments/assets/c6289e17-83b0-454b-874c-c361e0e69bc8" />

Lalu kita filter dengan IP Manwe (10.88.1.3) dan IP Eru (10.88.1.1) dan export file yang menampilkan semua paket yang berasal dari atau menuju ke IP Address Manwe.

<img width="732" height="440" alt="image" src="https://github.com/user-attachments/assets/0be235ee-f624-499f-83d2-67d77d94bd32" />

## Soal 7

<img width="959" height="179" alt="image" src="https://github.com/user-attachments/assets/55bfe486-0b88-4090-9fb9-0a4645c2df3d" />

Ubah konfigurasi vsftpd

<img width="1919" height="1240" alt="image" src="https://github.com/user-attachments/assets/990d80f7-a723-4799-8755-5aa966f09274" />

Ainur
<img width="1168" height="807" alt="image" src="https://github.com/user-attachments/assets/64cb9644-43e1-4b10-b52e-836b475ed15c" />

Melkor
<img width="1115" height="437" alt="image" src="https://github.com/user-attachments/assets/756790a9-cd0b-4a01-b84a-9733e575a768" />

## Soal 8

<img width="1377" height="662" alt="image" src="https://github.com/user-attachments/assets/064a95dd-9bba-480c-b564-1900af52953a" />

<img width="1919" height="1251" alt="image" src="https://github.com/user-attachments/assets/60a7119a-b9d5-4ab5-99b6-5e990600b51b" />

<img width="1182" height="675" alt="image" src="https://github.com/user-attachments/assets/7874c567-d0bb-4a98-bf09-74e4372d7bb6" />

<img width="1919" height="1169" alt="image" src="https://github.com/user-attachments/assets/60cba103-dd66-49ac-b408-594e67e8f13a" />

<img width="1919" height="1165" alt="image" src="https://github.com/user-attachments/assets/36742292-9f4d-4dab-99e6-74bf09b6753d" />

<img width="1919" height="1245" alt="image" src="https://github.com/user-attachments/assets/eb862d9a-3d79-4243-b670-82a597c25036" />

<img width="1919" height="1171" alt="image" src="https://github.com/user-attachments/assets/a4e7176e-81f4-4e8f-8593-a88945abc3db" />

<img width="1379" height="1228" alt="image" src="https://github.com/user-attachments/assets/d8365dc5-5d89-411f-90e6-a81aec66c1e1" />

## Soal 9
<img width="803" height="287" alt="image" src="https://github.com/user-attachments/assets/a2024e9b-061b-45c6-8995-719e356a73ae" />

`ftp-data`
<img width="1919" height="985" alt="image" src="https://github.com/user-attachments/assets/0240ad46-95b4-4877-abf1-39a98facc88b" />

`ftp.request.command == "USER" or ftp.request.command == "PASS"`
<img width="1919" height="891" alt="image" src="https://github.com/user-attachments/assets/056c991f-6034-4cd2-aa38-7b4b4db9ffee" />

`ftp.request.command == "USER" or ftp.request.command == "PASS"`
<img width="1919" height="1014" alt="image" src="https://github.com/user-attachments/assets/ec767fd3-7c47-41aa-b129-85e95bb71ee7" />

`ftp.request.command == "STOR"`
<img width="1919" height="1014" alt="image" src="https://github.com/user-attachments/assets/8f446542-12fa-42f9-a9a7-089bad5984ea" />

`ftp.response.code >= 500`
<img width="1919" height="909" alt="image" src="https://github.com/user-attachments/assets/a3ad4792-20c8-4e51-8296-d81f83946505" />

## Soal 10

## Soal 14
Kita jalankan `nc 10.15.43.32 3401` dan buka file yang telah disediakan di Wireshark

a) How many packets are recorded in the pcapng file? (Format: int)
   > 500358

<img width="959" height="490" alt="Screenshot 2025-10-01 214353" src="https://github.com/user-attachments/assets/fb161240-69cd-4926-a234-76598a0fda19" />

b) What are the user that successfully logged in? (Format: user:pass)
   > nlenna:y4v4nn4_k3m3nt4r1

Menggunakan filter `http contain success` di Wireshark
<img width="1919" height="900" alt="Screenshot 2025-10-01 215104" src="https://github.com/user-attachments/assets/1fbcf78c-4e91-4e9d-a8ec-ce232c2d6f25" />

c) In which stream were the credentials found? (Format:int)
   > 41824
 
<img width="1036" height="549" alt="Screenshot 2025-10-01 215250" src="https://github.com/user-attachments/assets/d6af3d09-81b5-4144-99bd-6287db480097" />

d) What tools are used for brute force? (Format: Hydra v1.8.0-dev)
   > Fuzz Faster U Fool v2.1.0-dev

<img width="1284" height="293" alt="image" src="https://github.com/user-attachments/assets/a3dceb4b-24e7-4e0d-831f-91a9bb7113e5" />

flag `KOMJAR25{Brut3_F0rc3_gMmmf2sGnd9gbyg5zth5QYTqZ}`

<img width="1774" height="934" alt="Screenshot 2025-10-01 215525" src="https://github.com/user-attachments/assets/89d849bc-4cd7-4a94-8832-4808d0f92df8" />

## Soal 15
Kita jalankan `nc 10.15.43.32 3402` dan buka file yang telah disediakan di Wireshark

a) What device does Melkor use? (Format: string)
   > Keyboard

Dengan melihat detail di salah satu paket kita dapat mengetahui device yang digunakan

<img width="1919" height="926" alt="image" src="https://github.com/user-attachments/assets/430e481f-afcf-4c37-b609-b040ba3918f7" />

b) What did Melkor write? (Format: string)
   > UGx6X3ByMHYxZGVfeTB1cl91czNybjRtZV80bmRfcDRzc3cwcmQ=

Kita filter menggunakan `usb.transfer_type == 0x01` karena Keyboard adalah perangkat Human Interface Device (HID) dan transfer data utamanya (keypress yang sebenarnya) menggunakan Interrupt Transfer (Kode 0x01). Lalu save as plain text.

<img width="1158" height="683" alt="image" src="https://github.com/user-attachments/assets/016cb36b-6b76-42f9-bd99-3dbfa13528ed" />

Buat script menggunakan python sebagai alat Forensik Digital untuk menerjemahkan data hex dari log keylogger atau packet sniffer keyboard USB (dHID Report) menjadi teks yang dapat dibaca manusia.
| Modul | Peran Kunci dalam Parsing |
| :---: | :--- |
| **`re` & `os`** | Ekstraks data ntuk membersihkan baris log yang berantakan dan secara akurat **menarik keluar** 8 byte payload HID dari setiap entry, serta mengelola file path dengan aman. |
| **`binascii` & Maps** | Dekode Karakter menggunakan `binascii` untuk konversi angka hex dan dua peta (`KEY_MAP` dan `SHIFT_MAP`) berdasarkan standar **USB HID Usage Table** untuk menentukan karakter yang diketik. |

<img width="1741" height="858" alt="image" src="https://github.com/user-attachments/assets/e8c397a5-310f-4803-b17c-52bd3c0d5d5f" />

c) What is Melkor's secret message? (Format: string)
   > Plz_pr0v1de_y0ur_us3rn4me_4nd_p4ssw0rd
> 
Dari yang kita dapat di poin b, kita dapat menggunakan tools cyberchef dan pilih From Base64

<img width="1919" height="1106" alt="image" src="https://github.com/user-attachments/assets/46c0f011-d998-4b50-bce1-9520ff841df0" />

kita dapatkan flag `KOMJAR25{K3yb0ard_W4rr10r_QFOao5QKO262iKo3G4LIVp0Sm}`

<img width="1730" height="559" alt="image" src="https://github.com/user-attachments/assets/d9e18c0a-2393-437e-930c-c55b25ad1a9e" />

## Soal 16
