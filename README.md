# Linux Network Diagnostics
## Description
A script to troubleshoot network issues.

Built as a learning project to practice Linux networking commands.

## What it checks
 
The checks run in order, from the local machine outwards, so you can see where a problem starts:
 
1. **System information:** date, hostname and default gateway
2. **Network interfaces:** IPv4 addresses and interface status
3. **Routing table:** the routes configured on the machine
4. **Gateway connectivity:** ping to the default gateway
5. **External connectivity:** ping to `8.8.8.8`
6. **DNS resolution:** ping to a domain name (`visir.is`)
7. **TCP ports:** listening ports and the number of established 

## Prerequisites
- Linux with Bash
- `ip`, `ss`, `ping`, `awk` and `grep` (included in most distributions)
- Git, to clone the repository

## Usage
1. Clone the repository
```bash
git clone https://github.com/pedro-bacellar/linux-net-diag
cd linux-net-diag
```
2. Make executable if necessary
```bash
chmod +x netdiag.sh
```

3. Run the script
```bash
./netdiag.sh
```

## Log
 
Every run is also saved to `/tmp/diaglog.log` (new runs are appended to the file).

## What I practiced
 
`ip`, `ss`, `ping`, `grep`, `awk`, functions, command substitution and output redirection (`tee`) in Bash.
