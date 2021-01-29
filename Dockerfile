# Container image that runs your code
FROM ubuntu:20.04

RUN apt update ;\
    apt install -y docker.io ;\
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]