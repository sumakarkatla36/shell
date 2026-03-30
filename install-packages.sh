#!/bin/bash

ID=$(id -u)
if [ $ID -ne 0 ]
then 
  echo "ERROR:: PLEASE RUN THIS SCRIPT THROUGH ROOT USER"
  exit 1
else
  echo "you are root user"
fi # fi means reverse of if,indicating condition end

  echo "all arguments passed: $@"