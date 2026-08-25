#!/bin/bash
echo "======================================"
echo "System Monitoring and Alerting Script"
echo "======================================"


#--------------------------------------
#Configuration
#--------------------------------------

DISK_THRESHOLD=10
MEMORY_THRESHOLD=10

LOG_DIR="logs"
LOG_FILE="$LOG_DIR/system-monitor.log"

#-------------------------------
#Create log directory
#-------------------------------

mkdir -p "$LOG_DIR"

#-----------------------------
#Logs
#-----------------------------

echo "Date: $(date)"
echo
echo

#-------------------------
#Start log entry
#-------------------------
echo "===================================================" >> "$LOG_FILE"
echo "System Monitoring Report" >> "$LOG_FILE"
echo "===================================================" >> "$LOG_FILE"
echo
echo "$(date '+%Y-%m-%d %H:%M:%S') - System Monitoring Started!!!" >> "$LOG_FILE"


