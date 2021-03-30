FROM docker.io/fedora:32

RUN  yum update -y && \
     yum install -y iperf3 && \ 
     yum clean all

ENTRYPOINT trap : TERM INT; sleep infinity & wait # Listen for kill signals and exit quickly.


