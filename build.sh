#!/usr/bin/env bash

echo "In build.sh"
# This creates a go build named after this directory
# CGO_ENABlED=0 will force go to build statically
CGO_ENABLED=0 GOOS=linux go build .
docker build -t tristanmacelli/summary .
go clean 