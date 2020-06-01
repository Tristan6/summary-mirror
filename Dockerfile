# add the necessary instructions
# to create a Docker container image
# for your Go summary server

FROM alpine:3.7
RUN apk add --no-cache ca-certificates
# This is copying the go build file (which named after the directory) into the container
COPY summary /summary
EXPOSE 5050-5060
ENTRYPOINT ["/summary"]