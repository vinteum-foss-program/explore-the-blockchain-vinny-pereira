# Only one single output remains unspent from block 123,321. What address was it sent to?
for tx in $(bitcoin-cli getblock $(bitcoin-cli getblockhash 123321) | jq -r .tx[])
do
    bitcoin-cli getrawtransaction "$tx" true | jq -c .vout[] | while read i
    do
        n=$(echo $i | jq -r .n)
        res=$(bitcoin-cli gettxout "$tx" "$n")
        if [ -n "$res" ]
        then
            echo $res | jq -r .scriptPubKey.address
            exit 0
        fi
    done
done
