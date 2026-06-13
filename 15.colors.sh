
#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR: Please run this script with root privilage"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
      echo "ERROR:: Installing $2 is $R failure $N"
      exit 1
    else
      echo "Installing $2 is $G success $N"
fi
}

dnf install mysql -y
VALIDATE $? "MySQL"


dnf install nginx -y
VALIDATE $? "Nginx"


dnf install python3 -y
VALIDATE $? "Python3"