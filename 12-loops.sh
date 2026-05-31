#!/bin/bash

USERID=$(id -u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log" 
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

#check root access or not
if [ $USERID -ne 0 ]; then 
    echo    "Pls run this script with root access"
    exit 1
fi

# first org -> What are yu trying install
# second org--> exit code 
validate(){  
    if [ $2 -ne 0   ]; then 
            echo "$TIMESTAMP [Error] installing $1 is ... $R Failed $N" | tee -a $LOGS_FILE
            exit 1
            else 
            echo "$TIMESTAMP [info] installing $1 is $G Success.." |   tee -a $LOGS_FILE
    fi
    }   
    

for package in $@
    do
        echo "Installing $package..."
        dnf list installed $package &>> $LOGS_FILE
        if [ $? -ne 0 ]; then
            dnf install $package -y &>> $LOGS_FILE
            validate $package $?
            else
            echo "$TIMESTAMP [INFO] $package already installed ... $Y SKIPPING $N"
        fi
    done



    

