#!/bin/bash

#everything in shell script is a string, there are no data types like int, float, etc.


number1=10
number2=20
name="Chintu"
sum=$(($number1 + $number2+$name))

echo "sum is: $sum"
