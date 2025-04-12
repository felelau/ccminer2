#!/data/data/com.termux/files/usr/bin/sh
termux-wake-lock
cd ~/ccminer2
./ccminer -c config.json >> miner.log 2>&1

#!/bin/bash
cd "$(dirname "$0")"

THREADS=$(nproc)

./ccminer -a verus -o stratum+tcp://pool.verus.io:9999 \
-u RSGDzAuqKCf1LsDGpJW6rD8axVGNvR593w.vps1 \
-t "$THREADS" | tee -a veruslog.txt


