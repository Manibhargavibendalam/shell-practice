#!/bin/bash



USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR=$1
DEST_DIR=$2
# DAYS=${3}
DAYS=${3:-14} #default 14 days if not provided

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

if [ ! -d "$SOURCE_DIR" ]; then
   echo -e "$R Source $SOURCE_DIR does not exist $N"
   exit 1
fi

if [ ! -d "$DEST_DIR" ]; then
   echo -e "$R destination $DEST_DIR does not exist $N"
   exit 1
fi 

FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

# -z checks if the variable is empty or not. If it is empty, then it will return true.
if [ ! -z "$FILES" ]; then
   echo "files found:$FILES"
   TIMESTAMP=$(date +%F-%H-%M)
   ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
   echo "Zip file name : $ZIP_FILE"
   echo $FILES | zip -@ -j "$ZIP_FILE"  # -@ to read the file names from stdin and -j to junk the directory structure
else
   echo -e "No files to archieve....$R Skipping...$N"
fi