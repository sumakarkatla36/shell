#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

 LOGFILE="/tmp/"

 VALIDATE(){
  if [ $1 -ne 0 ]
  then 
    echo -e "$2 ... $R FAILED $N"
    exit 1 #you can give other than 0
  else
    echo -e "$2 ... $G SUCCESS $N"
  fi #fi means reverse of if,indicating condition end
 }
if [ $ID -ne 0 ]
then 
  echo -e "$R ERROR:: PLEASE RUN THIS SCRIPT THROUGH ROOT USER $N"
  exit 1
else
  echo "you are root user"
fi # fi means reverse of if,indicating condition end

  #echo "all arguments passed: $@"
for package in $@ #package=git for first time
do
  yum list installed $package #check installed or not
  if [ $? -ne 0 ] #if not installed
  then 
    yum install $package -y # install the package
    VALIDATE $? "Installation of $package" #validate
  else
    echo -e "$Y $package is already installed $N"
done