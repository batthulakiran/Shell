#!/bin/bash

USERID=$(id -u)

#check root access or not
if [ $USERID -ne 0 ]; then 
    echo    "Pls run this script with root access"
    exit 1
fi
   
    #echo "I am continuing..."
    dnf list installed mariadb105
    if [ $? eq 0 ]; then 
        echo " MYSQL already installed...skipping"
        else
    fi
    echo    "installing MYSQL..."
    dnf install mariadb105 -y

    if [ $? -ne 0   ]; then 
    echo "installing MYSQL is ... Failed"
    exit 1
    else 
        echo "installin MYSQL is Sucess.."

        fi
    fi
