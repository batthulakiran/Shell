#!/bin/bash

USERID=$(id -u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log" 

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
            echo "installing $1 is Success.."
    fi
    }   
    

    for package in $@
    do
        echo    "installing $package"
        dnf list installed $package &>> $LOGS_FILE
        if [ $? -ne 0 ]; then 
            dnf intsall $package -y &>> $LOGS_FILE
            VALIDATE    "Installing $package" $?
        else
            echo "$package already installing... SKIPPING" &>> $LOGS_FILE
         fi   

    done
    

