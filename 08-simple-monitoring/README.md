https://roadmap.sh/projects/simple-monitoring-dashboard

# Description
This folder contains of my solution for "Simple monitoring" project. Source code contains only of three scripts `setup.sh`, `test_dashboard.sh`, `cleanup.sh`.

Instruction contains of steps on how to use these scripts

# Instruction

## Setup Netdata
```bash
chmod +x setup.sh
./setup.sh
```

## Load system to test dashboard
```bash
chmod +x test_dashboard.sh
./test_dashboard.sh load_percentage time_s
```

## Cleanup
```bash
chmod +x cleanup.sh
./cleanup.sh
```
