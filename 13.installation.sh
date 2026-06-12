
#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR: Please run this script with root privilage"
    exit 1
fi

dnf install mysql -y
if [ $? -ne 0 ]; then
    echo "ERROR:: Installing mysql is failure"
    exit 1
else
    echo "Installing mysql is success"
fi


dnf install nginx -y
if [ $? -ne 0 ]; then
    echo "ERROR:: Installing nginx is failure"
    exit 1  
else
    echo "Installing nginx is success"
fi