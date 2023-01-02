# README

Make sure you have created an SSL certificate for the fulcrum server. Otherwise:

1. install `openssl`
2. `openssl genrsa -des3 -out server.pass.key 2048`
3. `openssl rsa -in server.pass.key -out server.key`
4. `rm server.pass.key`
5. `openssl req -new -key server.key -out server.csr`
6. `openssl x509 -req -sha256 -days 365 -in server.csr -signkey server.key -out server.crt`
7. `rm server.csr`
8. move `server*` to `certs` folder.
