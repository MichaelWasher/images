FROM quay.io/support-tools/net-tools:latest

# Install Requirements
RUN dnf install -y \
    conntrack-tools \
    ethtool \
    hostname \
    iproute \
    net-tools \
    numactl \
    procps-ng \
    psmisc \
    sysstat \
    util-linux \
    && \
    dnf clean all

ADD monitor.sh /monitor/monitor.sh
ADD collect-metrics.sh /entrypoint/collect-metrics.sh

ENTRYPOINT /entrypoint/collect-metrics.sh 
