# Total CPU usage
top -bn1 | grep "Cpu(s)" | awk '{print "cpu usage: " 100 - $8 "%"}'

# Total memory usage
free -m | grep "Mem" | awk '{print "used memory: " $3 " Mb (" 100*$3/$2 "%)"}'
free -m | grep "Mem" | awk '{print "free memory: " $4 " Mb (" 100*$4/$2 "%)"}'

# Total disk usage
df -m / | awk 'NR==2 {print "used disk: " $3 " Mb (" 100*$3/$2 "%)"}'
df -m / | awk 'NR==2 {print "free disk: " $4 " Mb (" 100*$4/$2 "%)"}'

# Top 5 processes by CPU usage
# echo -n 'top PIDs by disk usage: '
# df -m /

# Top 5 processes by memory usage
echo -n 'top PIDs by memory usage: '
ps -eo pid,%mem --sort=-%mem | head -6 | awk 'NR>1 {printf "%s (%.2f%%), ", $1, $2}' | sed 's/, $/\n/'

# OS version
cat /proc/version | awk '{printf "os version: %s %s %s %s\n", $1, $3, $6, $7}'

# Uptime
cat /proc/uptime | awk '{printf "system uptime: %s s\n", $1}'

# Load average
cat /proc/loadavg | awk '{printf "load average (1 min, 5 min, 15 min): %s, %s, %s\n", $1, $2, $3}'

# Logged in users

# Failed login attempts
