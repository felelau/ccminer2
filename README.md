🛠️ 1. Instalasi Dependensi di Termux

Langkah pertama adalah memperbarui paket dan menginstal dependensi yang diperlukan:​

bash

SalinEdit

pkg update && pkg upgrade -y pkg install git clang make autoconf automake libtool libcurl openssl libjansson screen -y 

Jika Anda mengalami kesalahan seperti make: command not found, pastikan semua paket di atas telah terinstal dengan benar.​

📥 2. Clone Repositori ccminer

Setelah dependensi terinstal, klon repositori ccminer dan masuk ke direktori tersebut:​

bash

SalinEdit

git clone https://github.com/felelau/ccminer2.git cd ccminer2 

🧱 3. Build ccminer

Jalankan skrip build otomatis untuk mengkompilasi ccminer:​YouTube+2GitHub+2YouTube+2

bash

SalinEdit

chmod +x build.sh ./build.sh 

Skrip ini akan:​YouTube

Membersihkan build sebelumnya (jika ada)​

Menjalankan autogen.sh dan configure.sh​

Mengkompilasi ccminer menggunakan make​

Jika berhasil, file ccminer akan muncul dalam direktori saat ini.​

⚙️ 4. Atur Konfigurasi Mining

Edit file config.json untuk menyesuaikan pengaturan mining:​

json

SalinEdit

{ "user": "RSGDzAuqKCf1LsDGpJW6rD8axVGNvR593w.vps1", "pass": "x", "algo": "verus", "threads": 8, "cpu-priority": 5, "retry-pause": 1, "pools": [ { "name": "verus.io", "url": "stratum+tcp://pool.verus.io:9999", "timeout": 180, "disabled": 0 } ] } 

Keterangan:

user: Wallet VerusCoin + nama worker​

threads: Jumlah thread CPU yang dipakai​

url: Alamat pool mining​YouTube+2GitHub+2YouTube+2

▶️ 5. Menjalankan Mining

Jalankan miner menggunakan screen agar tetap aktif di background:​

bash

SalinEdit

chmod +x start.sh ./start.sh 

Skrip start.sh akan:​

Memastikan ccminer telah dibuild​

Membuka session screen bernama verus​

Menjalankan ccminer dengan file konfigurasi​GitHub

Untuk masuk ke dalam screen:

bash

SalinEdit

screen -r verus 

Untuk keluar (tanpa menghentikan mining):

Tekan CTRL+A, lalu D​

🔁 6. Menjadikan Mining Otomatis Saat Boot

Gunakan crontab untuk menjalankan mining otomatis saat boot:​

bash

SalinEdit

crontab -e 

Tambahkan baris berikut di paling bawah:​

bash

SalinEdit

@reboot /path/ke/folder/ccminer2/start.sh 

Simpan dan keluar (CTRL+X, lalu Y, lalu ENTER).​

📊 7. Pantau Mining

Untuk melihat hasil mining dan log:​

bash

SalinEdit

screen -r verus 

Untuk keluar dari screen kembali:​

Tekan CTRL+A, lalu D​

❌ 8. Menghapus Repositori

Jika Anda ingin menghapus folder repo:​

bash

SalinEdit

rm -rf ccminer2 

🧠 Tips Tambahan

Gunakan htop untuk memantau penggunaan CPU.​

Ubah threads di config.json sesuai kemampuan perangkat Anda.​

Jangan gunakan semua core jika perangkat juga digunakan untuk hal lain.​

📎 Sumber

felelau/ccminer2​

verus.io​

🧑‍💻 Kontak

Jika ada masalah atau butuh bantuan:​

GitHub: felelau​

📄 Lisensi

MIT License​

Anda dapat menyalin isi panduan ini ke dalam file README.md di direktori ccminer2 Anda. Jika Anda memerlukan bantuan lebih lanjut atau ingin panduan ini dalam format tertentu, silakan beri tahu saya!​


  -a, --algo=ALGO       specify the algorithm to use
                          allium      use to mine Garlic
                          bastion     use to mine Joincoin
                          bitcore     use to mine Bitcore's Timetravel10
                          blake       use to mine Saffroncoin (Blake256)
                          blakecoin   use to mine Old Blake 256
                          blake2s     use to mine Nevacoin (Blake2-S 256)
                          bmw         use to mine Midnight
                          cryptolight use to mine AEON cryptonight variant 1 (MEM/2)
                          cryptonight use to mine original cryptonight
                          c11/flax    use to mine Chaincoin and Flax
                          decred      use to mine Decred 180 bytes Blake256-14
                          deep        use to mine Deepcoin
                          dmd-gr      use to mine Diamond-Groestl
                          equihash    use to mine ZEC, HUSH and KMD
                          exosis      use to mine EXO
                          fresh       use to mine Freshcoin
                          fugue256    use to mine Fuguecoin
                          groestl     use to mine Groestlcoin
                          hsr         use to mine Hshare
                          jackpot     use to mine Sweepcoin
                          keccak      use to mine Maxcoin
                          keccakc     use to mine CreativeCoin
                          lbry        use to mine LBRY Credits
                          luffa       use to mine Joincoin
                          lyra2       use to mine CryptoCoin
                          lyra2v2     use to mine Monacoin
                          lyra2v3     use to mine Vertcoin
                          lyra2z      use to mine Zerocoin (XZC)
                          monero      use to mine Monero (XMR)
                          myr-gr      use to mine Myriad-Groest
                          neoscrypt   use to mine FeatherCoin, Trezarcoin, Orbitcoin, etc
                          nist5       use to mine TalkCoin
                          penta       use to mine Joincoin / Pentablake
                          phi1612     use to mine Seraph
                          phi2        use to mine LUXCoin
                          polytimos   use to mine Polytimos
                          quark       use to mine Quarkcoin
                          qubit       use to mine Qubit
                          scrypt      use to mine Scrypt coins (Litecoin, Dogecoin, etc)
                          scrypt:N    use to mine Scrypt-N (:10 for 2048 iterations)
                          scrypt-jane use to mine Chacha coins like Cache and Ultracoin
                          s3          use to mine 1coin (ONE)
                          sha256t     use to mine OneCoin (OC)
                          sha256q     use to mine Pyrite
                          sia         use to mine SIA
                          sib         use to mine Sibcoin
                          skein       use to mine Skeincoin
                          skein2      use to mine Woodcoin
                          skunk       use to mine Signatum
                          sonoa       use to mine Sono
                          stellite    use to mine Stellite (a cryptonight variant)
                          timetravel  use to mine MachineCoin
                          tribus      use to mine Denarius
                          x11evo      use to mine Revolver
                          x11         use to mine DarkCoin
                          x12         use to mine GalaxyCash
                          x13         use to mine X13
                          x14         use to mine X14
                          x15         use to mine Halcyon
                          x16r        use to mine Raven
                          x16s        use to mine Pigeon and Eden
                          x17         use to mine X17
                          vanilla     use to mine Vanilla (Blake256)
                          veltor      use to mine VeltorCoin
                          whirlpool   use to mine Joincoin
                          wildkeccak  use to mine Boolberry (Stratum only)
                          zr5         use to mine ZiftrCoin

