ping 10.88.1.1 -c 100

# Jika RTT Rata-rata Tinggi (misalnya, > 50ms): Ini menunjukkan bahwa server Eru lambat merespons karena sedang memproses banyak request (termasuk spam ping Melkor). Kinerja Eru terpengaruh.
# Jika RTT Rata-rata Rendah (< 5ms): Serangan tidak memengaruhi kinerja respons dasar Eru. Server Eru berhasil menangani 100 request tambahan dengan mudah tanpa melambat.
