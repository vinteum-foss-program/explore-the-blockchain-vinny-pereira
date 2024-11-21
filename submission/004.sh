# Using descriptors, compute the taproot address at index 100 derived from this extended public key:
xpub="xpub6Cx5tvq6nACSLJdra1A6WjqTo1SgeUZRFqsX5ysEtVBMwhCCRa4kfgFqaT2o1kwL3esB1PsYr3CUdfRZYfLHJunNWUABKftK2NjHUtzDms2"
checksum=$(bitcoin-cli getdescriptorinfo "tr($xpub/0/*)" | jq -r .checksum)
bitcoin-cli deriveaddresses "tr($xpub/0/*)#$checksum" "[100,100]"
