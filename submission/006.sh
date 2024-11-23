# Which tx in block 257,343 spends the coinbase output of block 256,128?
coinbasetx=$(bitcoin-cli getblock $(bitcoin-cli getblockhash 256128) | jq -r .tx[0])
blocktxs=$(bitcoin-cli getblock $(bitcoin-cli getblockhash 257343) | jq -r .tx[])

for tx in $blocktxs
do
    match=$(bitcoin-cli getrawtransaction $tx true | jq --arg coinbasetx "$coinbasetx" -r '.vin[] | select(has("txid") and .txid == $coinbasetx) | true')
    if [ $match ]; then
        echo $tx
        break
    fi
done
