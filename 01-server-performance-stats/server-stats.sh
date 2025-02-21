# Total CPU usage
top -bn1 | grep "Cpu(s)" | awk '{print "cpu usage: " 100 - $8 "%"}'

# Total memory usage
free -m | grep "Mem" | awk '{print "used memory: " $3 " Mb (" 100*$3/$2 "%)"}'
free -m | grep "Mem" | awk '{print "free memory: " $4 " Mb (" 100*$4/$2 "%)"}'

# Total disk usage

# Top 5 processes by CPU usage

# Top 5 processes by memory usage

# OS version
cat /proc/version | awk '{printf "os version: %s %s %s %s\n", $1, $3, $6, $7}'

# Uptime
cat /proc/uptime | awk '{printf "system uptime: %s s\n", $1}'

# Load average

# Logged in users

# Failed login attempts
