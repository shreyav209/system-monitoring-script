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

#------------------------------------
#Disk  Monitoring
#------------------------------------


echo "-----------DISK USAGE--------------"

disk_usage=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

echo "Root filesystem usage : ${disk_usage}%"

#Throw alert message
if [ "$disk_usage" -ge "$DISK_THRESHOLD" ];
then
        echo "WARNING: Disk usage is high: ${disk_usage}%"
        echo "$(date '+%Y-%m-%d %H:%M:%S') - WARNING: Disk usage is ${disk_usage}%" >> "$LOG_FILE"
else
        echo "Disk usage is normal: ${disk_usage}%"
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Disk usage is normal: ${disk_usage}%" >> "$LOG_FILE"
fi

echo
echo
echo

