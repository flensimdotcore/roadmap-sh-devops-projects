#!/bin/bash

# Usage: ./test_dashboard.sh util_percent time_s

UTIL_PERCENT=$1
TIME_S=$2

stress --cpu $((($UTIL_PERCENT * $(nproc)) / 100)) --timeout "$TIME_S"s
