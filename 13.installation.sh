
#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR: Please run this script with root privilage"
    exit 1
fi

VALIDATE(){
    if [ $1 -ne 0 ]; then
      echo "ERROR:: Installing $2 is failure"
      exit 1
    else
      echo "Installing $2 is success"
fi
}

dnf install mysql -y
VALIDATE $? "MySQL"


dnf install nginx -y
VALIDATE $? "Nginx"


dnf install python3 -y
VALIDATE $? "Python3"