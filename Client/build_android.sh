#!/bin/sh

EXPO_DOCTOR_MESSAGE=`expo doctor`
if [[ $EXPO_DOCTOR_MESSAGE == *"Didn't find any issues with your project!"* ]]; 
then
  expo login -u $1 -p $2 --non-interactive
  expo build:android
else
  echo "Expo doctor failed! Please analyze further issues."
  echo $EXPO_DOCTOR_MESSAGE
fi
