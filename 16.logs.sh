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
echo "Script started executed at : $(date)"



if [ $USERID -ne 0 ]; then
    echo "ERROR: Please run this script with root privilage"
    exit 1
fi


VALIDATE(){
    if [ $1 -ne 0 ]; then
      echo -e "ERROR:: Installing $2 is... $R failure $N"
      exit 1
    else
      echo -e "Installing $2 is.... $G success $N"
    fi
}

dnf list installed mysql &>> $LOG_FILE
if [ $? -ne 0 ]; then
    dnf install mysql -y &>> $LOG_FILE
    VALIDATE $? "MySQL"
else
    echo -e "MySQL is already installed... $Y Skipping... $N"
fi

dnf list installed nginx &>> $LOG_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y &>> $LOG_FILE
    VALIDATE $? "Nginx"
else
    echo -e "Nginx is already installed... $Y Skipping... $N"
fi


