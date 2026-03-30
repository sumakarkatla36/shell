#!/bin/bash

ID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGFILE="/tmp/script.log"

VALIDATE() {
  if [ $1 -ne 0 ]
  then 
    echo -e "$2 ... ${R}FAILED${N}"
    exit 1
  else
    echo -e "$2 ... ${G}SUCCESS${N}"
  fi
}

if [ $ID -ne 0 ]
then 
  echo -e "${R}ERROR:: PLEASE RUN THIS SCRIPT THROUGH ROOT USER${N}"
  exit 1
else
  echo -e "${G}you are root user${N}"
fi

for package in $@
do
  yum list installed $package &>> $LOGFILE

  if [ $? -ne 0 ]
  then 
    yum install $package -y &>> $LOGFILE
    VALIDATE $? "Installation of $package"
  else
    echo -e "${Y}$package is already installed${N}"
  fi
done