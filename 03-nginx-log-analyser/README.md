https://roadmap.sh/projects/nginx-log-analyser

# Description
This folder contains of my solution for "Nginx Log Analyser" project. Source code contains only of one single script `nginx-log-analyser.sh`.

Script uses only default Linux commands for a better performance and compatibility.

# Instruction
To run the solution:
1. Make shell script executable:
    ```bash
    chmod +x ./nginx-log-analyzer
    ```
2. On first run the script:
   ```bash
   ./nginx-log-analyzer <path-to-log>
   ```

Following output will look something like this:
```bash
Top 5 IP addresses with the most requests:
178.128.94.113 - 1087 requests
142.93.136.176 - 1087 requests
138.68.248.85 - 1087 requests
159.89.185.30 - 1086 requests
86.134.118.70 - 277 requests
Top 5 most requested paths:
/v1-health - 4560 requests
/ - 270 requests
/v1-me - 232 requests
/v1-list-workspaces - 127 requests
/v1-list-timezone-teams - 75 requests
Top 5 response status codes:
200 - 5740 requests
404 - 937 requests
304 - 621 requests
400 - 192 requests
"-" - 31 requests
Top 5 user agents:
DigitalOcean - 4347 requests
Mozilla/5.0 - 513 requests
Mozilla/5.0 - 332 requests
Custom-AsyncHttpClient - 294 requests
Mozilla/5.0 - 282 requests
```
