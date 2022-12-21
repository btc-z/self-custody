.PHONY: btc health


btc:
	docker-compose up

health:
	curl --show-error --netrc-file ~/.netrc --data-binary '{"jsonrpc": "1.0", "id": "curltest", "method": "getblockchaininfo", "params": []}' http://127.0.0.1:8332/ | jq
