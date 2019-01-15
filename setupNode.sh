#!/bin/bash
echo "rpcconnect=127.0.0.1" >> /root/.wolfcoin/wolfcoin.conf
echo "rpcport=4835" >> /root/.wolfcoin/wolfcoin.confwolfcoin.conf
echo "rpcuser=am12341234" >> /root/.wolfcoin/wolfcoin.confwolfcoin.conf
echo "rpcpassword=am12341234" >> /root/.wolfcoin/wolfcoin.confwolfcoin.conf

ufw limit ssh/tcp
ufw allow 4836/tcp
ufw default allow outgoing
ufw status

apt-get update
apt-get -y install python-virtualenv
git clone https://github.com/dashpay/sentinel.git
apt-get install -y /root/.wolfcoin/sentinel/virtualenv
virtualenv /root/.wolfcoin/sentinel/./venv
/root/.wolfcoin/sentinel/./venv/bin/pip install -r /root/.wolfcoin/sentinel/requirements.txt

echo "dash_conf=/root/.wolfcoin/wolfcoin.conf" >> /root/.wolfcoin/sentinel/sentinel.conf
pkill -9 -f wolfcoind
wolfcoin-cli mnsync status
