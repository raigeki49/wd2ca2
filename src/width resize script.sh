#!/bin/bash

IMAGE="$1" #First argument. This is the path of the image the user wants to resize. 
WIDTH="$2" #Second argument. This is the width the user wants his image to have.
IMAGENAME=$(echo $IMAGE | cut -d"." -f 1) #splitting the path the user inputs in order to get the path without the extension at the end
EXT=$"."$(echo $IMAGE | cut -d"." -f 2) #splitting the string path in order to only have the extension the image has.
if [ -z "$IMAGE" ]; then #checking if the path the user input is an empty string.
    exit 1 #if the first argument is empty the program exits with error code 1.
fi 

if [ -z "$WIDTH" ] || [ $WIDTH -lt 1 ] ; then #checking wheter the inputted width from the user is either an empty string or less than 1.
    WIDTH=100 #If yes the value of the width will be 100.
fi

convert $IMAGE -resize "$WIDTH"x  $IMAGENAME$WIDTH$EXT #command to resize the image. This command doesnt have a height value so that the height value is proportional to the width.