# Self Custody

A more detailed explanation can be found [here](https://medium.com/@btc-z/programmers-guide-to-bitcoin-self-custody-623eeac4405a)

## Run `bitcoind`

1. update `bitcoin.conf`
2. run `make bitcoind` to start `bitcoind`
3. wait for `bitcoind` to finish IBD (initial block download)
4. run `make health` after IBD is finished to verify successful setup. (Make sure you have `curl` installed)

The docker-compose file under `bitcoind` folder uses [ruimarnho](https://hub.docker.com/r/ruimarinho/bitcoin-core)'s image. Configuration is based on the local config file under the `./conf/bitcoin.conf` path.

We recommend storing the bitcoind's RPC credentials in `~/.netrc`. 

The `~/.netrc` should follow the format below.

```
machine <Use 127.0.0.1 if run locally> login <Put RPC user name here> password <Put RPC password here> 
```

Assume (1) `~/.netrc` uses the same credential in your `bitcoin.conf` AND (2) `bitcoind` is up-to-date and running in good health, you should observe the following output log by executing the `make health` command.

```
{
  "result": {
    "chain": "main",
    "blocks": 768376,
    "headers": 768376,
    "bestblockhash": "000000000000000000046c59ca7ec947dbb0008151e6d3aa1a065c5638305040",
    "difficulty": 35364065900457.12,
    "time": 1671639089,
    "mediantime": 1671636501,
    "verificationprogress": 0.9999976758420501,
    "initialblockdownload": false,
    "chainwork": "00000000000000000000000000000000000000003c00a6183801cbf2f8b3660e",
    "size_on_disk": 505088531797,
    "pruned": false,
    "warnings": ""
  },
  "error": null,
  "id": "curltest"
}
```

## Run `fulcrum`

We chose Fulcrum based on [Server Performance Guide](https://sparrowwallet.com/docs/server-performance.html)

1. Run `make download` to download the Fulcrum executable from its official website.
2. (Optional) run `make clean` to clean up downloaded files
3. Modify `./conf/fulcrum.conf`
4. Run `make fulcrum` to start fulcrum
5. [Download and install sparrow wallet](https://sparrowwallet.com/download/)
6. Inside sparrow wallet, navigate to **Preference**, **Server**, **Edit Server**, and select the **Private Electrum** option.
7. Fill in the host and port information and the certificate path
8. Click **Test Connection** to verify fulcrum is connected successfully

If everything is set up correctly and after you click **Test Connection**, you should see something like this:

```
Connected to Fulcrum 1.9.0 on protocol version 1.4
Batched RPC enabled.
Server Banner: Connected to a Fulcrum 1.9.0 server
```


## Troubleshooting

### SSL Certificate

Make sure you have created an SSL certificate for the fulcrum server. Otherwise:

1. install `openssl`
2. `openssl genrsa -des3 -out server.pass.key 2048`
3. `openssl rsa -in server.pass.key -out server.key`
4. `rm server.pass.key`
5. `openssl req -new -key server.key -out server.csr`
6. `openssl x509 -req -sha256 -days 365 -in server.csr -signkey server.key -out server.crt`
7. `rm server.csr`
8. move `server*` to `certs` folder.

## Issues

Please submit issues/questions [here](https://github.com/btc-z/self-custody/issues). 

--- 

[Buy me a coffee if this project helped you](https://www.buymeacoffee.com/btcz)


![bmc_qr](https://user-images.githubusercontent.com/119766095/210685968-d2c6aaa4-13ba-4e30-bdb8-1d417c35df2c.png)
