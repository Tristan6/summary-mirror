#!/usr/bin/env bash

echo "In build.sh"
GOOS=linux go build .
# docker build -t jtanderson7/summary .
go clean 