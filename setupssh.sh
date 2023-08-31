#!/bin/bash

#License under # GNU Lesser general license v2
echo "if the script fails you are missing open-ssh and maybe sshd type them in to find out if thy're not installed\n \n"

if [ -f ~/.ssh/mee.pub ]; then
        echo "key already exists "
else
        ssh-keygen -t rsa -b 4096 -f ~/.ssh/mee -N ""
        echo "generated...\n"
        cat ~/.ssh/mee.pub >> ~/.ssh/authorized_keys
        echo "key was authorized."
fi

echo "to copy key to remote:\n ssh-copy-id -p 8022 -i ~/.ssh/mee.pub IP_address"

grep -q "PasswordAuthentication" /data/data/com.termux/files/usr/etc/ssh/sshd_config || (echo "Please set password for termux shell" && passwd)
read -p "Start ssh server? (y/n): " start_ssh

if [ "$start_ssh" == "y" ]; then
        sshd
        read -p "Set your IP: " ip
        read -p "Set you Port (prefer 8022): " port
        echo "Port is set to $port on IP: $ip"
        echo "you can now use scp to transfer your files, syntax varies from local to remote ,and remote to local "
        ssh -p $port $ip
fi
