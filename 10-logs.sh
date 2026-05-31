#!/bin/bash

USERID=$(id -u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log" # /var/log/shell-script/10-logs.sh.log

#check root access or not
if [ $USERID -ne 0 ]; then 
    echo    "Pls run this script with root access"
    exit 1
fi

# first org -> What are yu trying install
# second org--> exit code 
validate(){  
    if [ $2 -ne 0   ]; then 
            echo "installing mariadb105 is ... Failed" | tee -a $LOGS_FILE
            exit 1
            else 
            echo "installin mariadb105 is Sucess.." | tee -a $LOGS_FILE
    fi
    }   
    
    #echo "I am continuing..."
    dnf list installed mariadb105 &>> $LOGS_FILE

    if [ $? -eq 0 ]; then 
        echo " mariadb105 already installed...skipping" | tee -a $LOGS_FILE
        else
    
        echo    "installing MYSQL..."
        dnf install mariadb105 -y &>> $LOGS_FILE            
                validate mariadb105 $?
      
    fi

        dnf list installed nginx &>> $LOGS_FILE

    if [ $? -eq 0 ]; then 
        echo " nginx already installed...skipping"  | tee -a $LOGS_FILE
        else
    
        echo    "installing nginx..."
        dnf install nginx -y &>> $LOGS_FILE
             validate nginx $?
    fi
    

