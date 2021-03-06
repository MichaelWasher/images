#!/bin/bash
readarray -t COREDNS_PIDS < <(pgrep coredns)
echo "Gathering metrics ..."
mkdir /network-metrics
rm -Rf /network-metrics/*
echo "Gathering monitor metrics ..."
cd /network-metrics
NSENTER_PIDS=()
CONNTRACK_PIDS=()
for COREDNS_PID in "${COREDNS_PIDS[@]}"
do      
    nsenter -n -t $COREDNS_PID bash -c "while true ; do date ; conntrack -L -n ; sleep 5; done" >> conntrack-${COREDNS_PID}.txt &
    CONNTRACK_PIDS+=($!)
    mkdir -p "monitor-${COREDNS_PID}"
    pushd "monitor-${COREDNS_PID}"
    nsenter -n -t $COREDNS_PID bash /monitor/monitor.sh -d 5 -i 120 &
    NSENTER_PIDS+=($!)
    popd
done
wait "${NSENTER_PIDS[@]}"
kill "${CONNTRACK_PIDS[@]}"
tar -czf /network-metrics.tar.gz /network-metrics
echo "Done with network metrics collection."

sleep infinity & wait
