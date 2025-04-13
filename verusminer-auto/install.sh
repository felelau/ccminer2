#!/bin/bash
sudo apt update && sudo apt install -y screen
screen -dmS verusminer bash run_miner.sh
