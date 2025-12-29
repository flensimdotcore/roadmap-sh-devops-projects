https://roadmap.sh/projects/ssh-remote-server-setup

# Description
This folder contains of my solution for "SSH Remote Server Setup" project. Source code contains only of one single file `README.md`.

Instruction contains of steps I took to get my simple server on `DigitalOcean` up and running, get access to it via ssh, and configure `fail2ban` to prevent brute force attacks.

# Instruction

1. Go to `www.digitalocean.com`
2. Sign In / Sign Up
3. Create -> Droplets
4. Choose Region -> Choose the closest to you
5. Choose an image. OS -> `Ubuntu 22.04` (as I think it's the most stable as for 2025)
6. Choose Size. Droplet Type -> `Basic`
7. Choose Size. CPU options -> `Regular`, `4 GB RAM / 2 CPUs / 80 GB SSD Disk / 4 TB transfer`. It will cost `24$/mo`
8. Choose Authentication Method -> SSH Key (more secure than password and is required in this exercise). To create one go to `SSH key creation` part of this tutorial. If you already have one, `cat` the `.pub` one and paste in DigitalOcean window
9. Go to Billing (left panel, scroll a little down) and add your payment method
10. Now proceed to `Droplet setup` part of tutorial

## SSH key creation

1. Open terminal
2. Generate your key:
```bash
ssh-keygen
```
3. Leave the default file destination
4. You can enter the passphrase (twice)
5. Then proceed back to the main instruction

## Droplet setup
1. Login using password or public key that you provided in previous steps:
```bash
ssh root@<server_ip>
# or
ssh -i <path/to/your/private/key> root@<server_ip>
```
2. You will login as `root`, but best practice is to create an another user:
```bash
adduser <username>
usermod -aG sudo <username>
```
3. Now copy ssh keys from root to new user:
```bash
mkdir -p /home/<username>/.ssh
cp /root/.ssh/authorized_keys /home/<username>/.ssh/
chown -R <username>:<username> /home/<username>/.ssh
chmod 700 /home/<username>/.ssh
chmod 600 /home/<username>/.ssh/authorized_keys
```
4. And log in back as your new user:
```bash
ssh <username>@<server_ip>
```
5. Now let's configure our ssh server:
```bash
sudo nano /etc/ssh/sshd_config
```
Here add/change the following lines:
```bash
# To disable root logging - good practice
PermitRootLogin no

# Allow public key authentication
PubkeyAuthentication yes

# Disable password authentication
PasswordAuthentication no

# Allow only you user <username> to connect
AllowUsers <username>

# Change your ssh port to unusual one (REMEMBER THIS PORT!)
Port 23456

# Limit authentication tries and sessions
MaxAuthTries 3
MaxSessions 2
```
6. Restart ssh server:
```bash
sudo systemctl daemon-reload
sudo systemctl restart ssh.socket
```
7. Now let's install `fail2ban` for even more security:
```bash
sudo apt install fail2ban
```
8. Configure `fail2ban`:
```bash
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local
sudo nano /etc/fail2ban/jail.local
```
Find `[sshd]` configuration and paste/change:
```bash
port    = 23456 # enter your ssh port
enabled = true
maxretry = 3
bantime = 3600
```
9. Start `fail2ban`:
```bash
sudo systemctl start fail2ban
sudo systemctl enable fail2ban
```
10. Bonus: Let's configure and enable the firewall:
```bash
sudo ufw allow 23456/tcp # enter your ssh port
sudo ufw deny 22/tcp
sudo ufw enable
```
11. Done!
