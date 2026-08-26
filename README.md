# System Monitoring and Alerting Script

# Project Overview

This project is a Bash-based Linux system monitoring and alerting

The script monitors disk usage, memory usage, and system processes.
It generates warnings when predefined resource thresholds are
crossed and maintains a timestamped monitoring log.

# Objectives

- Monitor disk usage
- Monitor memory usage
- Identify CPU-intensive processes
- Identify memory-intensive processes
- Generate threshold-based alerts
- Maintain monitoring logs
- Practice Linux shell scripting
- Demonstrate Git version control

# Technologies Used

- Linux
- Bash Shell Scripting
- Git
- GitHub

# Prerequisites

- Linux environment
- Bash
- Git

# Linux Commands Used
df
free
ps
awk
sort
head
date
chmod

## Monitoring Thresholds

Threshold 
Disk : 80%
Memory: 80%

# Features

### Disk Monitoring

The script checks the root filesystem using the 'df' command.
If disk usage reaches or exceeds 80%, a warning is displayed.

### Memory Monitoring

The script calculates memory utilization using the 'free' command.
If memory usage reaches or exceeds 80%, a warning is displayed.

### Process Monitoring

The script displays the top five CPU-consuming processes and the
top five memory-consuming processes.

### Logging

Monitoring events are stored in:

logs/system_monitor.log

Log files are excluded from Git using `.gitignore`.

## How to Run

Make the script executable:

chmod u+x system_monitor.sh

Run the script:

./system_monitor.sh

## Sample Output

======================================
System Monitoring and Alerting Script
======================================
Date: Tue Aug 25 03:20:34 PM UTC 2026



-----------DISK USAGE--------------
Root filesystem usage : 34%
Disk usage is normal: 34%



--------------Memory Usage-------------
Memory usage : 16%
Memory usage is normal



--------Top CPU & Memory Processes-------------
Top 5 CPU-consuming processes:
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
shreya      1492  100  0.2  10884  4584 pts/0    R+   15:20   0:00 ps aux --sort=-%cpu
shreya      1479 24.0  0.1   7340  3700 pts/0    S+   15:20   0:00 /bin/bash ./system_monitor.sh
root           8  0.8  0.0      0     0 ?        I    14:47   0:17 [kworker/0:0-events]
shreya      1097  0.4  0.3  15128  7172 ?        S    14:49   0:08 sshd: shreya@pts/0
root        1238  0.2  0.0      0     0 ?        I    15:00   0:02 [kworker/1:0-cgroup_free]
Top 5 Memory-consuming processes:
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root        1281  0.1  2.1 479528 43216 ?        Ssl  15:03   0:01 /usr/libexec/fwupd/fwupd
root         363  0.0  1.3 289116 27452 ?        SLsl 14:47   0:01 /sbin/multipathd -d -s
root         743  0.0  1.1 109640 23204 ?        Ssl  14:47   0:00 /usr/bin/python3 /usr/share/unattended-upgrades/unattended-upgrade-shutdown --wait-for-signal
root         309  0.0  0.8  66856 17480 ?        S<s  14:47   0:00 /usr/lib/systemd/systemd-journald
root         726  0.0  0.6 468984 13720 ?        Ssl  14:47   0:00 /usr/libexec/udisks2/udisksd
==============================
   MONITORING COMPLETED
==============================



Log file: logs/system-monitor.log
