#Run Stage
FROM ubuntu:bionic

# copy binaries
COPY ./godbweb /bin/dist/godbweb
RUN chmod +x /bin/dist/godbweb

# copy configure
COPY conf.toml .

# copy assets
COPY assets .

EXPOSE 3000

ENTRYPOINT ["bash"]