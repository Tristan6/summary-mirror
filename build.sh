#!/usr/bin/env bash

echo "In build.sh"
# This creates a go build named after this directory
GOOS=linux go build .
docker build -t tristanmacelli/summary .
go clean 