
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
      echo -e "ERROR:: Installing $2 is... $R failure $N"
      exit 1
    else
      echo -e "Installing $2 is.... $G success $N"
fi
}

dnf list installed mysql
if [ $? -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "MySQL"
else
    echo -e "MySQL is already installed... $Y Skipping... $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    VALIDATE $? "Nginx"
else
    echo -e "Nginx is already installed... $Y Skipping... $N"
fi


dnf list installed python3
if [ $? -ne 0 ]; then 
    dnf install python3 -y
    VALIDATE $? "Python3"
else
    echo -e "Python3 is already installed... $Y Skipping... $N"
fi
