#!/bin/bash



USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 ) #getting script name without extension
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER #create logs folder if not exist
echo "Script started executed at : $(date)" | tee -a $LOG_FILE 

if [ $USERID -ne 0 ]; then
   echo "ERROR:: Please run this script with root privelege"
   exit 1
fi 

USAGE(){
    echo -e "$R USAGE:: sudo sh 24-backup.sh <source_folder> <destination_folder> <days>[optional,default 14 days] $N"
    exit 1
}

if [ $# -lt 2 ]; then
    USAGE
fi