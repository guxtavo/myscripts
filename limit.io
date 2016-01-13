#!/bin/bash
# limit.io - blkio wrarpper for ephemeral processes
# Usage: ./limit.io [bps] command with args

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
