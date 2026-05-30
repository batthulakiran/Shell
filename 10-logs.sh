#!/bin/bash

USERID=$(id -u)
LOGS_DIR=/home/ec2-user/shell-logs
LOGS_FILE="$LOGS_DIR/$0.log" # /home/ec2-user/shell-logs/10-logs.sh.log

#check root access or not
if [ $USERID -ne 0 ]; then 
    echo    "Pls run this script with root access"
    exit 1
fi

# first org -> What are yu trying install
# second org--> exit code 
validate(){  
    if [ $2 -ne 0   ]; then 
            echo "installing $1 is ... Failed"
            exit 1
            else 
            echo "installin $1 is Sucess.."
    fi
    }   
    
    #echo "I am continuing..."
    dnf list installed mariadb105  &>> $LOGS_FILE

    if [ $? -eq 0 ]; then 
        echo " MYSQL already installed...skipping"
        else
    
        echo    "installing MYSQL..."
        dnf install $1 -y
        VALIDATE MYSQL $?
      
    fi

        dnf list installed nginx &>> $LOGS_FILE

    if [ $? -eq 0 ]; then 
        echo " nginx already installed...skipping"
        else
    
        echo    "installing nginx..."
        dnf install nginx -y
             VALIDATE MySQL $?
    fi
    

