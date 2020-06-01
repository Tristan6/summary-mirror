#!/usr/bin/env bash

bash build.sh

echo "In deploy.sh"
docker push tristanmacelli/summary
chmod g+x ./refresh.sh

ssh -i ~/.ssh/slack-clone-server.pem ec2-user@slack.api.tristanmacelli.com 'bash -s' < refresh.sh