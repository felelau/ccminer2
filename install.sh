#!/bin/bash

# Masuk ke direktori script
cd "$(dirname "$0")"

# Cek jumlah core CPU
THREADS=$(nproc)

# Generate ccminer.conf dari template
sed "s/THREADS_PLACEHOLDER/$THREADS/" ccminer.conf.template > ccminer.conf

# Install screen kalau belum ada
apt update && apt install -y screen

# Buat script run_miner.sh
cat > run_miner.sh <<EOF
#!/bin/bash
cd "$(dirname "\$0")"
/usr/bin/screen -dmS verus ./ccminer
EOF

chmod +x run_miner.sh

# Tambahkan ke crontab untuk auto start saat boot
(crontab -l 2>/dev/null; echo "@reboot $(pwd)/run_miner.sh") | crontab -

# Jalankan sekarang juga
./run_miner.sh

echo "✅ Setup selesai. Mining dimulai dengan $THREADS thread."
