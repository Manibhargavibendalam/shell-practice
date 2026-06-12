#!/bin/bash

#everything in shell script is a string, there are no data types like int, float, etc.


number1=10
number2=20
name="Chintu"
sum=$(($number1 + $number2+$name))

echo "sum is: $sum"


LEADERS=("Modi" "Rahul" "Amit Shah")

echo "All leaders: ${LEADERS[@]}"
echo "First leader: ${LEADERS[0]}"
echo "Second leader: ${LEADERS[1]}"
echo "Third leader: ${LEADERS[2]}"