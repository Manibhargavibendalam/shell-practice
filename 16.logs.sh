#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0| cut -d "." -f1 ) #getting script name without extension
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER #create logs folder if not exist
echo "Script started executed at : $(date)"



if [ $USERID -ne 0 ]; then
    echo "ERROR: Please run this script with root privilage"
    exit 1
fi

dnf install mysql -y
if [ $? -ne 0 ]; then
    echo "ERROR:: Installing MySQL is failure"
    exit 1
else
    echo "Installing mysql is success"
fi


dnf install nginx -y
if [ $? -ne 0 ]; then
    echo "ERROR:: Installing Nginx is failure"
    exit 1
else
    echo "Installing Nginx is success"
fi

dnf install python3 -y
if [ $? -ne 0 ]; then
    echo "ERROR:: Installing Python3 is failure"
    exit 1
else
    echo "Installing Python3 is success"