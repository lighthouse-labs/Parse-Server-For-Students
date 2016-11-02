#!/bin/bash

# Use this script to create a new Parse Server instance or update an existing one.
# If you create a new instance, input a unique app name, master key and app id.
# If you just want to update an existing app, enter the existing app name, unique master key and app id.
# Running this script on an existing app will clear the app's database.

# Constants
herokuTeamName="ios-parse-servers"

# User Input
echo -n "App Name (must be unique): "
read appName
echo -n "Master Key: "
read masterKey
echo -n "App ID: "
read appID

serverURL="http://$appName.herokuapp.com/parse"

# Heroku
heroku apps:create --org $herokuTeamName $appName;
heroku config:set --app $appName MASTER_KEY=$masterKey APP_ID=$appID SERVER_URL=$serverURL;
heroku addons:create --app $appName mongolab;
heroku git:remote -a $appName;
git push heroku master
