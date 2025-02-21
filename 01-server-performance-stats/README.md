https://roadmap.sh/projects/server-stats

# Description
This folder contains of my solution for "Server Performance Stats" project. Source code contains only of one single script `server-stats.sh`.

Script uses only default Linux commands or interacts with system files (e.g. `/proc/uptime`) for a better performance and compatibility.

# Instruction
To run the solution:
1. Make shell script executable:
    ```bash
    chmod +x ./server-stats.sh
    ```
2. Run the script:
   ```bash
   ./server-stats.sh
   ```

The following output will look like this:
```
CPU usage: 12%
used memory: 3629 Mb (23.1205%)
free memory: 6818 Mb (43.4378%)
used disk: 89645 Mb (23.9443%)
free disk: 265656 Mb (70.957%)
top PIDs by CPU usage: 4677 (29.30%), 3918 (25.60%), 4146 (12.20%), 2553 (10.50%), 2388 (7.00%)
top PIDs by memory usage: 3918 (4.50%), 4677 (3.80%), 10597 (2.10%), 4190 (2.00%), 2553 (2.00%)
OS version: Linux 6.8.0-52-generic (Ubuntu 12.3.0-1ubuntu1~22.04)
system uptime: 19112.55 s
load average (1 min, 5 min, 15 min): 2.12, 1.89, 1.81
logged in users: ivan
```

Each line corresponds to a single parameter.