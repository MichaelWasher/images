FROM quay.io/support-tools/net-tools:latest

ADD monitor.sh /monitor/monitor.sh
ADD collect-metrics.sh /entrypoint/collect-metrics.sh

ENTRYPOINT /entrypoint/collect-metrics.sh 
