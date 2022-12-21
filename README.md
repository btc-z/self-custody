# Self Custody

## Motivation

I wanted to self custody Bitcoin using `bitcoind`, `electrs` and `sparrow`. But I couldn't find a good guide on running `bitcoind` + `electrs` in the same docker-compose file, so I decided to write one.


## Start `bitcoind`

The docker-compose file under `bitcoind` folder uses [ruimarnho](https://hub.docker.com/r/ruimarinho/bitcoin-core)'s image. Configuration is based on local config file under the `bitcoind/conf/bitcoin.conf` path.


To start `bitcoind`, run `make btc`. After finishing the initial block download, verify `bitcoind` is healthy by running `make health`. Make sure that you have created a `~/.netrc` file for bitcoind rpc credentials.

The `~/.netrc` should have similar format as below:

```
machine <BITCOIN-HOST: USE-127.0.0.1-IF-RUN-LOCALLY> login <INSERT-USERNAME> password <INSERT-PASSWORD> 
```

Assume (1) `~/.netrc` uses the same credential in your `bitcoin.conf` AND (2) bitcoind is up-to-date and runnning in good health, you should observe the following output log from `make health`

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

## Start `electrs`.

TODO

