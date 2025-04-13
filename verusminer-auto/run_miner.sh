#!/bin/bash

THREADS=$(nproc)
WALLET="RSGDzAuqKCf1LsDGpJW6rD8axVGNvR593w"
WORKER=$(hostname)

cd ..
./ccminer2/ccminer -a verus -o stratum+tcp://pool.verus.io:9998 -u ${WALLET}.${WORKER} -t ${THREADS} --no-color
