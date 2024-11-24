# Which public key signed input 0 in this tx:
txid="e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163"
bitcoin-cli decodescript $(bitcoin-cli getrawtransaction $txid true | jq -r .vin[0].txinwitness[-1]) | jq -r '.asm | split(" ") | .[1]'
