#!/usr/bin/env bash

# TODO: Generate certs (https://canvas.uw.edu/courses/1321414/assignments/4985754)
export TLSCERT=/etc/letsencrypt/live/slack.api.tristanmacelli.com/fullchain.pem
export TLSKEY=/etc/letsencrypt/live/slack.api.tristanmacelli.com/privkey.pem

docker rm -f summary

# clean up
docker image prune -f
docker volume prune -f

docker pull tristanmacelli/summary

docker run -d \
-p 443:443 \
--name summary \
-v /etc/letsencrypt:/etc/letsencrypt:ro \
-e TLSCERT=$TLSCERT \
-e TLSKEY=$TLSKEY \
tristanmacelli/summary
# --network=infrastructure \

docker ps