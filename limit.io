#!/bin/bash
# limit.io - blkio wrarpper for ephemeral processes
# Usage: ./limit.io [bps] command with args
# Examples
# This will limit dd to 175kB/s
# ./limit.io 175000 dd if=/dev/zero of=/home/gfigueir/50.dd bs=245K count=4 oflag=direct
# This will limit sosreport to 2M/s
# ./limit.io 2000000 sosreport --batch

cgroup_name=$(basename $(mktemp -d))
blkio_path=/sys/fs/cgroup/blkio
command=${*:2}
mm_ids="253:1" # fedora-vg
bw=$1

mkdir ${blkio_path}/${cgroup_name}

echo "${mm_ids} ${bw}" > \
  ${blkio_path}/${cgroup_name}/blkio.throttle.write_bps_device
echo "${mm_ids} ${bw}" > \
  ${blkio_path}/${cgroup_name}/blkio.throttle.read_bps_device

cgexec -g blkio:${cgroup_name} $command
cgdelete blkio:${cgroup_name}
