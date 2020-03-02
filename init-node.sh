#!/bin/bash
set -exm

export RPC_PORT=18232
export PORT=18344
export NODE_NAME="node"

mkdir -p $NODE_NAME

zcashd -dns=0 -datadir=$NODE_NAME -rpcport=$RPC_PORT -port=$PORT -regtest=1 -printtoconsole -rpcbind=* -rpcallowip=0.0.0.0/0 -rpcpassword=password -rpcuser=user -txindex=1 &

sleep 30

zcash-cli -datadir=$NODE_NAME -rpcport=$RPC_PORT -regtest=1 -rpcpassword=password -rpcuser=user generate 432

fg
