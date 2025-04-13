
# 🧠 VerusCoin Auto Miner Setup (ccminer2)

Repositori ini menyediakan script otomatis untuk menambang **VerusCoin (VRSC)** menggunakan **ccminer2**, baik di **VPS**, **Termux**, maupun **UserLAnd**.

---

## ✨ Fitur

- Build `ccminer2` otomatis
- Konfigurasi wallet, worker, dan jumlah thread langsung di script
- Menjalankan miner dengan `screen` (background)
- Autostart mining saat VPS reboot
- Dukungan untuk: **Termux**, **UserLAnd (Ubuntu)**, dan **VPS berbasis Linux**

---

## 🔧 1. Instalasi Dependensi

### 📱 A. Untuk Termux (Android)

Buka Termux, jalankan:

```bash
pkg update && pkg upgrade -y
pkg install git clang cmake automake make ncurses-utils screen -y
```

> Jika muncul error seperti `make: command not found`, pastikan `make` sudah diinstal.

### 💻 B. Untuk VPS / Ubuntu / UserLAnd

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install git build-essential automake screen libcurl4-openssl-dev -y
```

> Untuk UserLAnd, pastikan filesystem Ubuntu sudah aktif dan terminal berjalan.

---

## 📥 2. Clone Repositori

Clone repo ini dari GitHub:

```bash
git clone https://github.com/felelau/ccminer2.git
cd ccminer2/verusminer-auto
```

---

## ⚙️ 3. Jalankan Script Instalasi

Script ini akan:
- Meng-compile `ccminer2` dari source
- Menjalankan miner di `screen`
- Menggunakan semua core CPU secara default

Jalankan:

```bash
bash install.sh
```

---

## 🛠️ 4. Konfigurasi Mining

Script default akan menjalankan mining dengan konfigurasi berikut:

- **Wallet Verus**: `RSGDzAuqKCf1LsDGpJW6rD8axVGNvR593w`
- **Pool**: `stratum+tcp://pool.verus.io:9998`
- **Worker name**: nama hostname VPS atau perangkat kamu
- **Threads**: otomatis sesuai jumlah core CPU

> Untuk mengganti konfigurasi:
Edit file `run_miner.sh`:

```bash
nano run_miner.sh
```

Ubah bagian:

```bash
WALLET="RSGDzAuqKCf1LsDGpJW6rD8axVGNvR593w"
POOL="stratum+tcp://pool.verus.io:9998"
WORKER=$(hostname)
THREADS=$(nproc)
```

---

## 🚀 5. Menjalankan Mining Manual

Jika ingin menjalankan mining secara manual:

```bash
cd ~/ccminer2/verusminer-auto
screen -dmS verusminer bash run_miner.sh
```

Untuk melihat mining:

```bash
screen -r verusminer
```

Keluar dari screen tanpa menghentikan mining:

```bash
CTRL + A lalu tekan D
```

---

## 🔁 6. Autostart Mining Saat Boot (Khusus VPS/UserLAnd Ubuntu)

Agar mining berjalan otomatis saat reboot:

```bash
crontab -e
```

Tambahkan baris ini di paling bawah:

```bash
@reboot cd ~/ccminer2/verusminer-auto && screen -dmS verusminer bash run_miner.sh
```

Simpan dan keluar (`CTRL+O`, lalu Enter, lalu `CTRL+X` jika pakai `nano`).

---

## 🧪 7. Mengecek Proses Mining

- Lihat log mining:

```bash
screen -r verusminer
```

- Keluar dari log tanpa menghentikan:

```bash
CTRL + A lalu tekan D
```

- Jika ingin stop:

```bash
pkill screen
```

---

## 📬 Kontak

Jika mengalami kendala atau butuh bantuan, silakan buat issue di GitHub atau kirim pesan ke pemilik repo.

GitHub: [https://github.com/felelau/ccminer2](https://github.com/felelau/ccminer2)

---

## 📌 Catatan Tambahan

- File `install.sh` digunakan untuk setup otomatis
- File `run_miner.sh` digunakan untuk menjalankan mining
- Dukungan untuk mining di Android, VPS, atau server pribadi
- Pastikan koneksi internet stabil untuk mining
