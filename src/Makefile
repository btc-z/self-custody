start:
	docker-compose up

bitcoind:
	docker-compose up bitcoind

fulcrum:
	docker-compose up fulcrum

health:
	curl --show-error --netrc-file ~/.netrc --data-binary '{"jsonrpc": "1.0", "id": "curltest", "method": "getblockchaininfo", "params": []}' http://127.0.0.1:8332/ | jq

getwalletinfo:
	curl --show-error --netrc-file ~/.netrc --data-binary '{"jsonrpc": "1.0", "id": "curltest", "method": "getwalletinfo", "params": []}' http://127.0.0.1:8332/ | jq

download:
	wget https://github.com/cculianu/Fulcrum/releases/download/v1.9.0/Fulcrum-1.9.0-x86_64-linux.tar.gz | tar -xvzf Fulcrum-1.9.0-x86_64-linux.tar.gz | mv Fulcrum-1.9.0-x86_64-linux fulcrum_binary | rm -rf Fulcrum-1.9.0-x86_64-linux*

clean:
	rm -rf Fulcrum-1.9.0-x86_64-linux*

sparrow_log:
	tail -f ~/.sparrow/sparrow.log
