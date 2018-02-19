FROM debian:9

EXPOSE 4242 3002 3003 2775 4249

RUN apt-get update && \
    apt-get install -y wget gnupg && \
    wget http://download.opensuse.org/repositories/network:/osmocom:/nightly/Debian_9.0/Release.key && \
    apt-key add Release.key && \
    echo "deb http://download.opensuse.org/repositories/network:/osmocom:/nightly/Debian_9.0/ ./" > /etc/apt/sources.list.d/osmocom-nightly.list && \
    apt-get update && \
    apt-get install -y openbsc-dev osmocom-ipaccess-utils osmocom-nitb
    
ENTRYPOINT ["osmo-nitb"]
CMD ["-c", "/usr/share/doc/osmocom-nitb/examples/osmo-nitb/nanobts/openbsc.cfg"]