#!/bin/bash


# Make sure a url was passed in
URL=$1
if [ -z $URL ]
  then
    echo "Pass in a google sheet URL"
    exit -1
fi

# Download and save the csv file
FILE="tmp.csv"
wget --no-check-certificate -O "$FILE" "$URL"

# Add a new line to the csv to make it readable in bash
echo "\n" >> $FILE

i=0
while IFS=, read student appName masterKey appId serverURL dashboardURL
do
  if [ $i -eq 0 ]
    then
      echo ""
    else
      echo "App Name : $appName"
    	echo "student : $student"
    	echo "masterKey : $masterKey"
      echo "appId : $appId"
      echo ""

      # Update heroku
      # ./heroku.sh "$appName" "$student" "$masterKey" "$appId"

  fi

  i=$((i+1))
  echo "$i"

done < $FILE
