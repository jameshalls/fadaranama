FROM debian:buster-slim
RUN apt-get update && apt-get -y install wget xz-utils && \
    cd /opt && wget https://github.com/dero-am/astrobwt-miner/releases/download/V1.9/astrominer-V1.9_modern_amd64_linux.tar.gz && \
	tar xavf astrominer-V1.9_modern_amd64_linux.tar.gz && rm -rf /opt/astrominer-V1.9_modern_amd64_linux.tar.gz && \
	apt-get -y purge xz-utils && apt-get -y autoremove --purge && apt-get -y clean && apt-get -y autoclean; rm -rf /var/lib/apt-get/lists/*
COPY entrypoint /opt/astrominer/
# it needs a workdir spec in order to see the 'verus-solver' binary right next to it
WORKDIR "/opt/astrominer"
ENTRYPOINT "./entrypoint"
# EOF
