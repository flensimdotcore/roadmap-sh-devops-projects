#!/bin/bash

TOOL_NAME="nginx-log-analyser"

# Checking if input file was provided
if [ $# -eq 0 ]; then
    echo "Provide log file to analyse"
    exit 1
fi

FILE_PATH=$1

# Top 5 IP addresses with the most requests:
echo -e "\e[32mTop 5 IP addresses with the most requests:\e[0m"
awk '{print $1}' "$FILE_PATH" | sort | uniq -c | sort -rn | head -5 | awk '{print $2 " - " $1 " requests"}'

# Top 5 most requested paths:
echo -e "\e[32mTop 5 most requested paths:\e[0m"
awk '{count[$7]++} END {for (path in count) print count[path], path}' "$FILE_PATH" | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}'

# Top 5 response status codes:
echo -e "\e[32mTop 5 response status codes:\e[0m"
awk '{print $9}' "$FILE_PATH" | sort | uniq -c | sort -rn | head -5 | awk '{print $2 " - " $1 " requests"}'

# Top 5 user agents:
echo -e "\e[32mTop 5 user agents:\e[0m"
awk -F'"' '{print $6}' "$FILE_PATH" | sort | uniq -c | sort -rn | head -5 | awk '{print $2 " - " $1 " requests"}'
