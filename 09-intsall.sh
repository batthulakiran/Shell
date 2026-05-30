#!/bin/bash

USERID=$(id -u)

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
    dnf list installed mariadb105

    if [ $? -eq 0 ]; then 
        echo " MYSQL already installed...skipping"
        else
    
        echo    "installing MYSQL..."
        dnf install $1 -y
        VALIDATE MYSQL $?
      
    fi

        dnf list installed nginx

    if [ $? -eq 0 ]; then 
        echo " nginx already installed...skipping"
        else
    
        echo    "installing nginx..."
        dnf install nginx -y
             VALIDATE MySQL $?
    fi
    

