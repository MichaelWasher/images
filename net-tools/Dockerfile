FROM fedora:38

RUN dnf install -y \
  strace \
  bind-utils \
  httpie \
  mtr \
  traceroute \
  iproute \
  tcpdump \
  rsync \
  wireshark-cli \
  procps-ng \
  tar \
  iperf3 && \
  dnf clean all 

ENTRYPOINT trap : TERM INT; sleep infinity & wait # Listen for kill signals and exit quickly.

