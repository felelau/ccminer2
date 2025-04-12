#!/data/data/com.termux/files/usr/bin/sh
termux-wake-lock
cd ~/ccminer2
./ccminer -c config.json >> miner.log 2>&1

