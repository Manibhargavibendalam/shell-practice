#!/bin.bash

set -e
error(){
    echo "There is a n error"
}

trap error ERR #this will call the error function when an error occurs

echo "Hello..."
echo "Before error..."
ccaffjl;dnf #here shell will understand there is an error and signal is ERR
echo "After error..."