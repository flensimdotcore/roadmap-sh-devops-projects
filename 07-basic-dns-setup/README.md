https://roadmap.sh/projects/basic-dns

# Description
This folder contains of my solution for "Basic DNS Setup" project. Source code contains only of one single file `README.md`.

Instruction contains of steps I took to get my domain on `GoDaddy` look up to my static site and my GitHub Pages site

# Instruction

1. Go to `www.godaddy.com`
2. Sign In / Sign Up
3. I already had a domain

## GitHub Pages
1. Open your domain settings
2. Forwarding -> Add new forwarding -> Enter my GitHub Pages URL

## Static Site Server
1. Open your domain settings
2. DNS records -> Add new record:
```
type: A
name: @
Data: <server_ip>
TTL: 1 hour
```
3. Save
