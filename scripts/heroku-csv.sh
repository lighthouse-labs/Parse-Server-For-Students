#!/bin/bash


# Make sure a file was passed in
FILE=$1
if [ -z "$FILE" ]
  then
    echo "Please pass in a csv file"
    exit -1
fi

if [[ "$FILE" == *.csv ]]
then
    echo "File $FILE"
else
  echo "Please pass in a file that ends with .csv"
  exit -1
fi

# Add a new line to the csv to make it readable in bash
echo "\n" >> "$FILE"

i=0
while IFS=, read student appName masterKey appId serverURL dashboardURL
do
  if [ $i -eq 0 ] || [ -z "$appName" ]
    then
      echo ""
    else
      echo "App Name : $appName"
    	echo "student : $student"
    	echo "masterKey : $masterKey"
      echo "appId : $appId"
      echo ""

      # Update heroku
      ./heroku.sh "$appName" "$masterKey" "$appId" "$student"

  fi

  i=$((i+1))
  echo "$i"

done < "$FILE"
