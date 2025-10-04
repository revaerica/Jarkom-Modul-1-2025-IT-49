# Di Eru
apt-get update
apt install netcat-traditional -y

echo "--- Memeriksa Port 21 (FTP) ---"
nc.traditional -v -z 10.88.1.2 21

echo "--- Memeriksa Port 80 (HTTP) ---"
nc.traditional -v -z 10.88.1.2 80

echo "--- Memeriksa Port Rahasia 666 ---"
nc.traditional -v -z 10.88.1.2 666
