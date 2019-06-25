#!/bin/bash

psql_host=$1
port=$2
db_name=$3
user_name=$4
password=$5

timestamp=$(vmstat -t |tail -1|awk '{print $18,$19}')
memory_free=$(vmstat --unit M |tail -1 |awk '{print $4}')
cpu_idel=$(vmstat  --unit M |tail -1 |awk '{print $15}')
cpu_kernel=$(vmstat --unit M |tail -1|awk '{print $14}')
disk_io=$(vmstat -d |tail -1 |awk '{print $10}')
disk_available=$(df -BM | tail -6 | head -1 | awk '{print $4}')


