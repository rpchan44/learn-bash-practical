#!/bin/bash

# Function to display CPU usage
function cpu_usage {
    echo "CPU Usage:"
    top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"% used"}'
    echo
}

# Function to display memory usage
function memory_usage {
    echo "Memory Usage:"
    free -h | awk 'NR==2{printf "Used: %.2fGB / Total: %.2fGB\n", $3, $2}'
    echo
}

# Function to display disk usage
function disk_usage {
    echo "Disk Usage:"
    df -h | grep '^/dev/'
    echo
}

# Function to display uptime
function system_uptime {
    echo "System Uptime:"
    uptime -p
    echo
}

# Call functions to display statistics
cpu_usage
memory_usage
disk_usage
system_uptime
