#!/bin/bash

# Use this script to create a new Parse Server instance or update an existing one.
# If you create a new instance, input a unique app name, master key and app id.
# If you just want to update an existing app, enter the existing app name, unique master key and app id.
# Running this script on an existing app will clear the app's database.

# You should either pass in teh appName masterKey appId and userName, in that order, when you run the script; or don't pass in any values and allow the script to ask you for each input


# Constants
herokuTeamName="ios-parse-servers"

# User Input
if [ -z "$1" ]
  then
  echo -n "App Name : "
  read appName
else
  appName="$1"
fi

# Heroku
heroku apps:destroy --app "$appName" --confirm "$appName"
