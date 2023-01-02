FROM ubuntu:18.04

LABEL AUTHOR="btc-z"

RUN apt-get update
RUN apt-get install -y python3 curl

# these ports should be published
EXPOSE 8000
EXPOSE 8080

# run `make download` to get fulcrum pre-complied binary
COPY fulcrum_binary/Fulcrum /bin/
COPY fulcrum_binary/FulcrumAdmin /bin/
