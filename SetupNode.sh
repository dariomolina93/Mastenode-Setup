#!/bin/bash
cd /root/.wolfcoin
echo "rpcconnect=127.0.0.1" >> wolfcoin.conf
echo "rpcport=4835" >> wolfcoin.conf
echo "rpcuser=am12341234" >> wolfcoin.conf
echo "rpcpassword=am12341234" >> wolfcoin.conf

ufw limit ssh/tcp
ufw allow 4836/tcp
ufw default allow outgoing
ufw status

apt-get update
apt-get -y install python-virtualenv
git clone https://github.com/dashpay/sentinel.git && cd sentinel
apt-get install -y virtualenv
virtualenv ./venv
./venv/bin/pip install -r requirements.txt

echo "dash_conf=/root/.wolfcoin/wolfcoin.conf" >> sentinel.conf
pkill -9 -f wolfcoind
wolfcoin-cli mnsync status
