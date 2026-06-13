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
echo "Script started executed at : $(date)" | tee -a $LOG_FILE #log the start time of script execution

# tee -a $LOG_FILE ::: this command will append the output of echo command to log file as well as print it on terminal. 


if [ $USERID -ne 0 ]; then
    echo "ERROR: Please run this script with root privilage" | tee -a $LOG_FILE
    exit 1
fi


VALIDATE(){
    if [ $1 -ne 0 ]; then
      echo -e "ERROR:: Installing $2 is... $R failure $N" | tee -a $LOG_FILE
      exit 1
    else
      echo -e "Installing $2 is.... $G success $N" | tee -a $LOG_FILE
    fi
}

dnf list installed mysql &>> $LOG_FILE
if [ $? -ne 0 ]; then
    dnf install mysql -y &>> $LOG_FILE
    VALIDATE $? "MySQL"
else
    echo -e "MySQL is already installed... $Y Skipping... $N" | tee -a $LOG_FILE
fi

dnf list installed nginx &>> $LOG_FILE
if [ $? -ne 0 ]; then
    dnf install nginx -y &>> $LOG_FILE
    VALIDATE $? "Nginx"
else
    echo -e "Nginx is already installed... $Y Skipping... $N" | tee -a $LOG_FILE
fi


