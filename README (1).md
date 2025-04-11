
# ccminer2 - VerusCoin CPU Miner Setup (Step-by-Step Guide)

Repositori ini berisi panduan lengkap untuk:
- Meng-clone dan build `ccminer2` dari source.
- Mengatur konfigurasi mining VerusCoin (VRSC).
- Menjalankan mining otomatis dengan `screen`.
- Menjadikan miner berjalan otomatis saat VPS dinyalakan.

---

## 🛠️ 1. Prasyarat (Dependencies)

### ✅ Jalankan perintah berikut untuk menginstal tools dan library yang dibutuhkan:

```bash
sudo apt update
sudo apt install -y git build-essential automake libtool autoconf cmake \
pkg-config libcurl4-openssl-dev libssl-dev libjansson-dev libgmp-dev \
libboost-all-dev libudev-dev screen
```

---

## 📥 2. Clone Repositori

```bash
git clone https://github.com/felelau/ccminer2.git
cd ccminer2
```

---

## 🏗️ 3. Build ccminer

### 🧱 Jalankan script build otomatis:

```bash
chmod +x build.sh
./build.sh
```

Script ini akan:
- Membersihkan build sebelumnya (jika ada)
- Menjalankan `autogen.sh` dan `configure.sh`
- Melakukan kompilasi `ccminer` menggunakan `make`

Jika berhasil, akan muncul file `ccminer` dalam direktori saat ini.

---

## ⚙️ 4. Atur Konfigurasi Mining

### 🔧 Edit file `config.json` untuk menyesuaikan:

```json
{
  "user": "RSGDzAuqKCf1LsDGpJW6rD8axVGNvR593w.vps1",
  "pass": "x",
  "algo": "verus",
  "threads": 8,
  "cpu-priority": 5,
  "retry-pause": 1,
  "pools": [
    {
      "name": "verus.io",
      "url": "stratum+tcp://pool.verus.io:9999",
      "timeout": 180,
      "disabled": 0
    }
  ]
}
```

**Keterangan:**
- `user`: Wallet VerusCoin + nama worker
- `threads`: Jumlah thread CPU yang dipakai
- `url`: Alamat pool mining

---

## ▶️ 5. Menjalankan Mining

### 🧵 Jalankan miner menggunakan `screen` agar tetap aktif di background:

```bash
chmod +x start.sh
./start.sh
```

Script `start.sh` akan:
- Memastikan ccminer telah dibuild
- Membuka session screen bernama `verus`
- Menjalankan `ccminer` dengan file konfigurasi

Untuk masuk ke dalam screen:
```bash
screen -r verus
```

Untuk keluar (tanpa menghentikan mining):
> Tekan `CTRL+A`, lalu `D`

---

## 🔁 6. Menjadikan Mining Otomatis Saat Boot

### Gunakan crontab:
```bash
crontab -e
```

Tambahkan baris berikut di paling bawah:
```bash
@reboot /path/ke/folder/ccminer2/start.sh
```

Simpan dan keluar (`CTRL+X`, lalu `Y`, lalu `ENTER`).

---

## 📊 7. Pantau Mining

Untuk melihat hasil mining dan log:
```bash
screen -r verus
```

Untuk keluar dari screen kembali:
> `CTRL+A`, lalu `D`

---

## ❌ 8. Menghapus Repositori

Jika kamu ingin menghapus folder repo:
```bash
rm -rf ccminer2
```

---

## 🧠 Tips Tambahan

- Gunakan `htop` untuk memantau penggunaan CPU.
- Ubah `threads` di `config.json` sesuai kemampuan VPS-mu.
- Jangan gunakan semua core jika VPS juga digunakan untuk hal lain.

---

## 📎 Sumber
- https://github.com/felelau/ccminer2
- https://verus.io

---

## 🧑‍💻 Kontak
Jika ada masalah atau butuh bantuan:  
GitHub: [felelau](https://github.com/felelau)

---

## 📄 Lisensi
MIT License
