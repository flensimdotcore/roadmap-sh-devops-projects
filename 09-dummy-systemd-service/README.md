https://roadmap.sh/projects/dummy-systemd-service

# Description
This folder contains of my solution for "Dummy Systemd Service" project. Source code contains of the service script `dummy.sh`, which just prints `"Dummy service is running..."` every 10 seconds; `dummy.service` template for systemd service; and `deploy_service.sh` script which is used for creating and deleteing a systemd service.

Instruction contains of steps on how to use the `deploy_service.sh` script

# Instruction

## Create systemd dummy service
```bash
chmod +x deploy_service.sh
./deploy_service.sh
```

## Delete systemd dummy service
```bash
./deploy_service.sh --rm
```
