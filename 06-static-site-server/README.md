https://roadmap.sh/projects/static-site-server

# Description
This folder contains of my solution for "Static Site Server" project. Source code contains of one deploy script `deploy.sh`.

Script uses only default Linux commands for a better performance and compatibility.

# Instruction
To run the solution:
1. Make shell script executable:
    ```bash
    chmod +x ./deploy.sh
    ```
2. Create .env with your server configuration:
```bash
REMOTE_USER="<server_user>"
REMOTE_HOST="<server_ip"
REMOTE_SSH_PORT="<server_ssh_port>" # usually just 22
REMOTE_PATH="<path_to_your_files_on_server"
```
3. Run the script:
   ```bash
   ./deploy.sh
   ```

Following output will look something like this:
```bash
[INFO] Loading environment variables from .env
[INFO] Checking connection to server...
Connection established
[INFO] Connection to server established
[INFO] Starting synchronization with server...
[INFO] Local folder: ./src/
[INFO] Remote folder: user@x.x.x.x:/var/www/mysite/html
sending incremental file list
images/
images/logo.png
      6.925.608 100%   11,63MB/s    0:00:00 (xfr#1, to-chk=1/8)

sent 6.927.588 bytes  received 41 bytes  2.771.051,60 bytes/sec
total size is 6.926.094  speedup is 1,00
[INFO] Deployment completed successfully!
[INFO] Website is available at: http://x.x.x.x
```

4. [BONUS] use help command:
```bash
./deploy.sh --help
```
