#!/bin/bash
# Script untuk menjalankan ccminer di screen session bernama 'verus'

# Masuk ke direktori tempat script ini berada
cd "$(dirname "$0")"

# Cek apakah screen 'verus' sudah jalan
if screen -list | grep -q "verus"; then
    echo "🟡 Miner sudah berjalan di screen session 'verus'"
else
    echo "🟢 Menjalankan miner di background..."
    /usr/bin/screen -dmS verus ./ccminer
fi
