#!/bin/bash

NUM1=10
NUM2=SQL

sum=$(($NUM1+$NUM2))

echo    "sum is : $sum"

#Array
MOVIES=("kiran","KK","KKKK")
echo    " movies are : ${MOVIES[@]}"
echo    "firstmovie: ${Movies[1]}"  