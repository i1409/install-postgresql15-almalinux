#!/bin/bash
R='\033[0;31m'   #'0;31' is Red's ANSI color code
G='\033[0;32m'   #'0;32' is Green's ANSI color code
Y='\033[1;32m'   #'1;32' is Yellow's ANSI color code
B='\033[0;34m'   #'0;34' is Blue's ANSI color code
NC='\033[0m'
echo -e "${G}[+] Adding Postgresql REPO${NC}"
yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
if [ $? -ne 0 ]
then
	echo -e "${R}[-] Failed to add Postgresql REPO... Exiting...${NC}"
	exit 1
fi
echo -e "${G}[+] Updating repositories...${NC}"
yum -y update
echo -e "${G}[+] Adding epel release REPO ...${NC}"
sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
if [ $? -ne 0 ]
then
	echo -e "${R}[-] Failed to add epel release REPO... Exiting...${NC}"
	exit 1
fi
echo -e "${G}[+] Installing Postgresql 15${NC}"
yum -y install postgresql15-server
if [ $? -ne 0 ]
then
	echo -e "${R}[-] Failed to install Postgresql 15${NC}"
	exit 1
fi
echo -e "${G}[+] Successfully installed Postgresql 15${NC}"

