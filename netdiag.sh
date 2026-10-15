#!/usr/bin/env bash

# Save everything printed on screen to a log file as well
LOG_FILE="/tmp/diaglog.log"
exec > >(tee -a "$LOG_FILE") 2>&1

# ---------- 1. System information ----------
get_info(){
printf "\n==================================================\n"
printf " System Information\n"
printf "==================================================\n"
printf "Date:             %s\n" "$(date +"%d %b %Y %T")"
printf "Hostname:         %s\n" "$(hostname)"
printf "Default Gateway:  %s\n" "$(ip route | grep default | awk '{printf $3}')"
}

# ---------- 2. Local network setup ----------
get_network_interfaces(){
printf "\n==================================================\n"
printf " Network Interfaces\n"
printf "==================================================\n"
ip -4 -br a
}

get_routing_table(){
printf "\n==================================================\n"
printf " Routing Table\n"
printf "==================================================\n"
ip route
}

# ---------- 3. Connectivity tests (local -> external -> DNS) ----------
check_gateway(){
printf "\n==================================================\n"
printf " Connectivity: Default Gateway\n"
printf "==================================================\n"
ping -c 3 $(ip route | grep default | awk '{print $3}')
}

check_external_ip(){
printf "\n==================================================\n"
printf " Connectivity: External IP (8.8.8.8)\n"
printf "==================================================\n"
ping -c 3 8.8.8.8
}

check_dns(){
printf "\n==================================================\n"
printf " Connectivity: DNS (visir.is)\n"
printf "==================================================\n"
ping -c 3 visir.is
}

# ---------- 4. Ports and connections ----------
check_tcp(){
printf "\n==================================================\n"
printf " TCP Listening Ports\n"
printf "==================================================\n"
ss -tpln
printf "\n--------------------------------------------------\n"
printf " TCP established connections: %s\n" "$(ss -tn state established | wc -l)"
printf -- "--------------------------------------------------\n"
}

# ---------- Main ----------
printf "==================================================\n"
printf "              NETWORK DIAGNOSTIC\n"
printf "==================================================\n"

get_info
get_network_interfaces
get_routing_table
check_gateway
check_external_ip
check_dns
check_tcp

printf "\n==================================================\n"
printf "              DIAGNOSTIC FINISHED\n"
printf "==================================================\n\n"