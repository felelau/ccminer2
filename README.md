# CCminer for Termux

Based on: https://github.com/Oink70/CCminer-ARM-optimized

Install latest arm64-v8a Termux: https://github.com/termux/termux-app/releases/download/v0.118.0/termux-app_v0.118.0+github-debug_arm64-v8a.apk

Proceed with installation, configuration & compilation:

1. Installing clang and dependencies:
```
yes | pkg update && pkg upgrade -y
yes | pkg install libjansson build-essential clang binutils git -y
```

2. Fix environment & clone repo:
```
cp /data/data/com.termux/files/usr/include/linux/sysctl.h /data/data/com.termux/files/usr/include/sys
git clone https://github.com/Darktron/ccminer.git
cd ccminer
chmod +x build.sh configure.sh autogen.sh start.sh
```

3. Edit Arch & Cores:
```
nano configure.sh
```

4. Compile ccminer:
```
CXX=clang++ CC=clang ./build.sh
```

5. Change your pools, address, and miner name with:
```
nano config.json
```

6. Finally run the miner with:
```
~/ccminer/start.sh
```


Clone Repositori

bash

SalinEdit

git clone https://github.com/felelau/ccminer2.git cd ccminer2 

🏗️ 3. Build ccminer

🧱 Jalankan script build otomatis:

bash

SalinEdit

chmod +x build.sh ./build.sh 

Script ini akan:

Membersihkan build sebelumnya (jika ada)

Menjalankan autogen.sh dan configure.sh

Melakukan kompilasi ccminer menggunakan make

Jika berhasil, akan muncul file ccminer dalam direktori saat ini.

⚙️ 4. Atur Konfigurasi Mining

🔧 Edit file config.json untuk menyesuaikan:

json

SalinEdit

{ "user": "RSGDzAuqKCf1LsDGpJW6rD8axVGNvR593w.vps1", "pass": "x", "algo": "verus", "threads": 8, "cpu-priority": 5, "retry-pause": 1, "pools": [ { "name": "verus.io", "url": "stratum+tcp://pool.verus.io:9999", "timeout": 180, "disabled": 0 } ] } 

Keterangan:

user: Wallet VerusCoin + nama worker

threads: Jumlah thread CPU yang dipakai

url: Alamat pool mining

▶️ 5. Menjalankan Mining

🧵 Jalankan miner menggunakan screen agar tetap aktif di background:

bash

SalinEdit

chmod +x start.sh ./start.sh 

Script start.sh akan:

Memastikan ccminer telah dibuild

Membuka session screen bernama verus

Menjalankan ccminer dengan file konfigurasi

Untuk masuk ke dalam screen:

bash

SalinEdit

screen -r verus 

Untuk keluar (tanpa menghentikan mining):

Tekan CTRL+A, lalu D

🔁 6. Menjadikan Mining Otomatis Saat Boot

Gunakan crontab:

bash

SalinEdit

crontab -e 

Tambahkan baris berikut di paling bawah:

bash

SalinEdit

@reboot /path/ke/folder/ccminer2/start.sh 

Simpan dan keluar (CTRL+X, lalu Y, lalu ENTER).

📊 7. Pantau Mining

Untuk melihat hasil mining dan log:

bash

SalinEdit

screen -r verus 

Untuk keluar dari screen kembali:

CTRL+A, lalu D

❌ 8. Menghapus Repositori

Jika kamu ingin menghapus folder repo:

bash

SalinEdit

rm -rf ccminer2 

🧠 Tips Tambahan

Gunakan htop untuk memantau penggunaan CPU.

Ubah threads di config.json sesuai kemampuan VPS-mu.

Jangan gunakan semua core jika VPS juga digunakan untuk hal lain.

📎 Sumber

https://github.com/felelau/ccminer2

https://verus.io

🧑‍💻 Kontak

Jika ada masalah atau butuh bantuan:
GitHub: felelau

📄 Lisensi

MIT License

yaml

SalinEdit

--- Kalau kamu mau, aku bisa bantu buatkan langsung file `README.md` dan taruh di repositori kamu, atau bantu ubah jadi markdown siap upload ke GitHub Pages. Mau lanjut? 

4o


