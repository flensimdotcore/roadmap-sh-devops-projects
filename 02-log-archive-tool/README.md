https://roadmap.sh/projects/log-archive-tool

# Description
This folder contains of my solution for "Log Archive Tool" project. Source code contains only of one single script `log-archive.sh`.

Script uses only default Linux commands for a better performance and compatibility.

# Instruction
To run the solution:
1. Make shell script executable:
    ```bash
    chmod +x ./log-archive.sh
    ```
2. On first run the script:
   ```bash
   ./log-archive.sh <directory-to-archive>
   ```
   Script will add itself to PATH, so from now on invoke the tool from anywhere in system by:
   ```bash
   log-archive <directory-to-archive>
   ```

Following output file will be named something like this:
```bash
logs_archive_20250221_184738.tar.gz
```