#Run Stage
FROM alpine:latest

# copy binaries
COPY ./godbweb /bin/godbweb

EXPOSE 3000

ENTRYPOINT ["/bin/godbweb serve"]