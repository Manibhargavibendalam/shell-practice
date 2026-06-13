#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

#$G is green color and $N is reset color to default..if we won't give N then it will continue with green color
echo -e "$G Hello World" 
echo "Check this color"
echo -e "$R Hello World $N" #if we gibe N then it will reset the color to default
echo "Check this color"