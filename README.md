# parse-server-example

This is a copy of Parse's [parse-server-example](https://github.com/ParsePlatform/parse-server-example) project, modified to make it easy for us to setup a Parse Server environment for Lighthouse Labs students.

The main change made to this project, is that it includes [parse-dashboard](https://github.com/ParsePlatform/parse-dashboard) on the same server. This means that a student can access their dashboard on heroku at the same ip address they use to access the parse from their iOS app.

This project follows different versioning and tagging than the original [parse-server-example](https://github.com/ParsePlatform/parse-server-example). Make sure to check the changelog for all changes and versions.

# Seting Up

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/lighthouse-labs/Parse-Server-For-Students)

* If you do not already have an account with Heroku, go to [https://signup.heroku.com/](https://signup.heroku.com/) and follow the instructions to create one.
* Click on the Deploy to Heroku button above which will take you to the `Create New App` setup.

> Note: If you have not yet linked your github account to heroku, you will be prompted do this now.

* Enter a unique name for you app:

![Create New app](http://i.imgur.com/1kqgCOV.png)

* Fill out the rest of the form:
  - `PARSE_MOUNT` leave this as `/parse`
  - `APP_ID` enter any alphanumeric string here, you will need to use this later.
  - `MASTER_KEY` enter any alphanumeric string here, you will need to use this later.  
  - `SERVER_URL` the URL that you will point your iOS app to. Make sure the app name is the same as the name you put in the first field.
  - `DASHBOARD_USER_NAME` set this to be the username you want to use to access parse dashboard.
  - `DASHBOARD_PASSWORD` set this to be the password you want to use to access parse dashboard.

> Note: For the `APP_ID` AND `MASTER_KEY` you can use an ID generator to create keys for you if you'd like <https://www.uuidgenerator.net/>

![Environment Variables](http://i.imgur.com/NzEDBd9.png)

Click the Deploy button, to deploy your app.

![Deploy](http://i.imgur.com/QTIP1OP.png)

> If this is your first Heroku app, you will be prompted to enter your credit card information. Don't worry, you will not get charged for any of this, but Heroku does require you to enter this information whether you're using the free or paid tools.


# Using it

Once you've deployed to Heroku, you can start using Parse Server from your app and access Parse Dashboard from your browser.

### Parse Server

Example using it on iOS (Swift) using the details from the Google Sheet:

```swift
//in your AppDelegate's didFinishLaunchingWithOptions

let configuration = ParseClientConfiguration { clientConfiguration in
    clientConfiguration.applicationId = "5CDeHX2xNhW11QZXr9AvtBbEQY0lft4jpUuMFt9g"
    clientConfiguration.server = "https://parse-server-ios-main.herokuapp.com/parse"
}
Parse.initialize(with: configuration)
```

### Parse Dashboard

The parse dashboard for each Parse Server instance is located at the `/dashboard` endpoint. For example, the dashboard for the main server `https://parse-server-ios-main.herokuapp.com/parse` is located at `https://parse-server-ios-main.herokuapp.com/dashboard`.

## Local Deployment

* Make sure you have at least Node 4.3. `node --version`
* Clone this repo and change directory to it.
* `npm install`
* Install mongo locally using http://docs.mongodb.org/master/tutorial/install-mongodb-on-os-x/
* Run `mongo` to connect to your database, just to make sure it's working. Once you see a mongo prompt, exit with Control-D
* Run the server with: `npm start`
* By default it will use a path of /parse for the API routes.  To change this, or use older client SDKs, run `export PARSE_MOUNT=/1` before launching the server.
* You now have a database named "dev" that contains your Parse data
* Install ngrok and you can test with devices
