#!/bin/bash

# Pindah ke direktori tempat ccminer berada
cd ~/ccminer2 || { echo "Folder ccminer2 tidak ditemukan!"; exit 1; }

# Cek apakah file executable ccminer ada
if [ ! -f ./ccminer ]; then
  echo "File ccminer tidak ditemukan! Pastikan sudah dikompilasi."
  exit 1
fi

# Cek apakah config.json tersedia
if [ ! -f config.json ]; then
  echo "File config.json tidak ditemukan!"
  exit 1
fi

# Jalankan ccminer di dalam screen session bernama 'miner'
echo "Menjalankan miner di background dengan screen session 'miner'..."
screen -dmS miner ./ccminer -c config.json

# Cek apakah berhasil dijalankan
if screen -list | grep -q "miner"; then
  echo "Miner berhasil dijalankan di dalam screen."
else
  echo "Gagal menjalankan miner!"
fi

