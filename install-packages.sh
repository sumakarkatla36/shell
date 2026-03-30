#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
if [ $ID -ne 0 ]
then 
  echo "$R ERROR:: PLEASE RUN THIS SCRIPT THROUGH ROOT USER $N"
  exit 1
else
  echo "you are root user"
fi # fi means reverse of if,indicating condition end

  echo "all arguments passed: $@"