#!/bin/bash
#
# setup-folders.sh
# Author: github.com/huskyctf
#
# Description: For when you spawn a temporary cloud attack box and need a
# quick, consistent folder layout for a CTF challenge.
#
# Usage: ./setup-folders.sh /path/to/your/empty/directory
#
#

# Check if user gives a valid empty directory

if [ $# -eq 0 ]; then
    echo "Usage: ./setup-folders.sh /path/to/your/directory"
    exit
fi

if [ ! -d $1 ]; then
    echo "Error: Specified directory does not exist"
    exit
fi

if [[ ! -r $1 || ! -w $1 ]]; then
    echo "Error: You do not have read/write permissions to specified directory"
    exit
fi

if [ ! -z "$(ls -A $1)" ]; then
    echo "Error: Please specify an empty directory"
    exit
fi


echo "[+] Script is running..."


# Create the subfolder layout

mkdir "$1/www" "$1/nmap" "$1/hosts" "$1/custom-wordlists"


# Add important blank files

touch "$1/www/index.html"
touch "$1/custom-wordlists/usernames.txt"
touch "$1/custom-wordlists/passwords.txt"


# Setup a notes.md with useful starting commands

cat << 'EOF' > "$1/notes.md"

# Penetration Test Notes

## Date:
## Name:


# Target



# Reconnaissance

## Host Discovery

## Port Scanning

## Service Enumeration



# Initial Access



# Privilege Escalation


EOF


# Generate an RSA key in case SSH access is possible on the target later

ssh-keygen -q -f $1/id_rsa -t rsa -C '' -N ''
mv "$1/id_rsa.pub" "$1/www/id_rsa.pub"


# Confirm script has completed

echo "[+] The script has finished and folders are setup"
