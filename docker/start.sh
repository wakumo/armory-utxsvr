#!/bin/bash

export BITCOIND_PATH=${BITCOIND_PATH:="/bitcoin_data"}

# Run "setup.py develop" if we need to
if [ ! -d /armory-utxsvr/armory_utxsvr.egg-info ]; then
    cd /armory-utxsvr; python2 setup.py develop; cd /
fi

# bitcoind_url must be passed in as first argument
BITCOIND_PATH=${BITCOIND_PATH} DISPLAY=localhost:1.0 xvfb-run --auto-servernum /usr/local/bin/armory-utxsvr ${PARAMS} $BITCOIND_URL
