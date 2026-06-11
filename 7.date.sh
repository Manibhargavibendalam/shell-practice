#!/bin/bash

# DATE=$(date)

start_time=$(date +%s)  # Capture the start time in seconds
sleep 10 # Simulating some work by sleeping for 10 seconds
end_time=$(date +%s)  # Capture the end time in seconds

total_time=$(($end_time-$start_time))

echo "Script executed in: $total_time seconds"