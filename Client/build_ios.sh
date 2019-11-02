#!/bin/sh

echo "Start iOS build..."

EXPO_DOCTOR_MESSAGE=`expo doctor`
if [[ $EXPO_DOCTOR_MESSAGE == *"Didn't find any issues with your project!"* ]];
then
  echo "Expo doctor didn't find any issues. Continuing with build!"
  EXPO_LOGIN_RESULT=`expo login -u $1 -p $2 --non-interactive`
  
  if [[ $EXPO_LOGIN_RESULT =~ *"Success"* ]];
  then 
    echo "Expo login was successful!"
    echo "Starting "
    expo build:ios
  else
    echo "Expo login failed!"
  fi
else
  echo "Expo doctor failed! Please analyze further issues."
  echo $EXPO_DOCTOR_MESSAGE
fi
