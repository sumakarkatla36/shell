#!/bin/bash

ID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGFILE="/tmp/$0-"

VALIDATE(){
  if [$1 -ne 0]
  then 
    echo -e "$2 ... $R FAILED $N"
  else
     echo -e "$2 ... $G SUCCESS $N"
  fi
} 

if [ $ID -ne 0 ]
then 
  echo -e "${R}ERROR:: PLEASE RUN THIS SCRIPT THROUGH ROOT USER${N}"
  exit 1
else
  echo -e "${G}you are root user${N}"
fi

#echo "All arguments passed: $@"

for package in $@
do
  yum list installed $package #check installed or not
  if [$? -ne 0] #if not installed
  then
    yum install $package -y #install the package
    VALIDATE $? "Installation of $package" #validate
  else
     echo -e "$package is already installed ... $Y SKIPPING $N"
  fi
done
