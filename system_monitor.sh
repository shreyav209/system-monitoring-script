#!/bin/bash
echo "======================================"
echo "System Monitoring and Alerting Script"
echo "======================================"


#--------------------------------------
#Configuration
#--------------------------------------

DISK_THRESHOLD=80
MEMORY_THRESHOLD=80

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



echo "--------------Memory Usage-------------"
#--------------------------------
#Memory usage
#--------------------------------

memory_usage=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')

echo "Memory usage : $memory_usage%"

if [ "$memory_usage" -ge "$MEMORY_THRESHOLD" ]
then
        echo "WARNING: Memory usage is above ${MEMORY_THRESHOLD}%"
        echo "$(date '+%Y-%m-%d %H:%M:%S') - WARNING: Memory usage is ${memory_usage}%" >> "$LOG_FILE"

else
        echo "Memory usage is normal"
        echo "$(date '+%Y-%m-%d %H:%M:%S') - Memory usage is normal: ${memory_usage}%" >> "$LOG_FILE"
fi


echo
echo
echo




