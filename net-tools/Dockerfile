FROM fedora:32 

RUN dnf install -y  \
  bind-utils \
  conntrack-tools \
  ethtool \
  hostname \
  httpie \
  iperf3 \
  iproute \
  iproute \
  mtr \
  net-tools \
  numactl \
  procps-ng \
  procps-ng \
  psmisc \
  rsync \
  strace \
  sysstat \
  tar \
  tcpdump \
  util-linux \
  wireshark-cli \
  &&  \
  dnf clean all  

ENTRYPOINT trap : TERM INT; sleep infinity & wait # Listen for kill signals and exit quickly.
