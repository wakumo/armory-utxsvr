#!/bin/bash

export BITCOIND_PATH=${BITCOIND_PATH:="/bitcoin_data"}

# Specify defaults (defaults are overridden if defined in the environment)
EXTRA_PARAMS=""
DEFAULT_BITCOIN_URL="http://rpc:rpc@bitcoin:8332"
if [ -n "$TESTNET" ]; then
    EXTRA_PARAMS="${EXTRA_PARAMS} --testnet"
    DEFAULT_BITCOIN_URL="http://rpc:rpc@bitcoin-testnet:18332"
fi

: ${BITCOIND_URL:=$DEFAULT_BITCOIN_URL}

# bitcoind_url must be passed in as first argument
BITCOIND_PATH=${BITCOIND_PATH} DISPLAY=localhost:1.0 xvfb-run --auto-servernum /usr/local/bin/armory-utxsvr ${EXTRA_PARAMS} $BITCOIND_URL
