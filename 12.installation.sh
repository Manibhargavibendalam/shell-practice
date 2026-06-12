#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
   echo "ERROR: Please run this script with root privilage"
fi

dnf install mysql -y

if [ $? -ne 0 ]; then
    echo "ERROR:: Installing mysql is failure"
else
    echo "Installing mysql is success"
fi

