#!/bin/sh
# Script for easy overview of drive health.
# Should propperly be refactored to have a list of drives insted of repeating
# code.

# Setting variables with smartctl health data (should parse output to just 
# passed or failed
ADA0=$(smartctl -H /dev/ada4 | tail -n 2 | head -n 1 | awk '{ print $6 }')

ADA1=$(smartctl -H /dev/ada1 | tail -n 2 | head -n 1 | awk '{ print $6 }')
ADA2=$(smartctl -H /dev/ada2 | tail -n 2 | head -n 1 | awk '{ print $6 }')
ADA3=$(smartctl -H /dev/ada3 | tail -n 2 | head -n 1 | awk '{ print $6 }')
ADA4=$(smartctl -H /dev/ada4 | tail -n 2 | head -n 1 | awk '{ print $6 }')

# Output stuff

echo ''

echo Drive health check!
echo '------------------------------------------------------------------------'
echo '    type   |  device  |  status  '
echo '------------------------------------------------------------------------'

echo ''

echo ' System drive: ada0' ${ADA0} # System drive

echo 'ZFSRaid drive: ada1' ${ADA1} # ZFS raid drive 1
echo 'ZFSRaid drive: ada2' ${ADA2} # ZFS raid drive 2
echo 'ZFSRaid drive: ada3' ${ADA3} # ZFS raid drive 3
echo 'ZFSRaid drive: ada4' ${ADA4} # ZFS raid drive 4

echo ''
