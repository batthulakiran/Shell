#!/bin/bash

USERID=$(id -u)

#check root access or not

if[$USERID -ne 0]; then 
echo    "pls run this script with root access"
exit 1

fi

    #echo " i am continuing..."

    echo    "installin MYSQL..."

    dnf install mysql -y

if [ $? -ne 0];then 

    echo " installing mYSQL is ... Failed"
    exit 1
else 
        echo "installin MYSQL is Sucess.."

fi