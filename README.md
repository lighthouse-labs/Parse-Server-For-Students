# parse-server-example

This is a copy of Parse's [parse-server-example](https://github.com/ParsePlatform/parse-server-example) project, modified to make it easy for us to setup a Parse Server environment for Lighthouse Labs students.

The main change made to this project, is that it includes [parse-dashboard](https://github.com/ParsePlatform/parse-dashboard) on the same server. This means that a student can access their dashboard on heroku at the same ip address they use to access the parse from their iOS app.

# Seting Up

We are using heroku to deploy an individual dyno for each student. Each dyno is deployed to the `ios-parse-servers` team on LighthouseLabs' heroku. 

### Google Sheet

We are storing the information for each server in this [google sheet](https://docs.google.com/spreadsheets/d/1hBRyle189P6GNA8llTylm0mRz0IFAB6G4sDRL5RuXlk/edit?usp=sharing). This sheet is then shared with all the students so they can quickly see their app keys and urls. 

We use generic names for the servers themselves (server1, server2, etc) then assign a server to each student when a new cohort starts.

The easiest way to create or update the servers, is to first update the [google sheet](https://docs.google.com/spreadsheets/d/1hBRyle189P6GNA8llTylm0mRz0IFAB6G4sDRL5RuXlk/edit?usp=sharing). Once you're happy with the information in the sheet, you can run one of the provided scripts that will handle generating heroku dynos for you.

### Bash Scripts

There are currently 2 different bash scripts you can use to generate heroku dynos from the google sheet:

* [Parse Server from Google Sheet instructions](https://github.com/lighthouse-labs/Parse-Server-For-Students/blob/master/Parse_Server_from_google_sheet_instructions.md) This will update or create all servers in the google sheet.
* [Parse Server script instructions](https://github.com/lighthouse-labs/Parse-Server-For-Students/blob/master/Parse_Server_from_google_sheet_instructions.md) This will update or create only a sinlge server.


#### How the scripts work

The scripts work by taking advantage of the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-command-line). You must install this and login before you can run any of the scripts.

Most of the work going on in the script is either getting input for the server information, or parsing input from the Google Sheet's csv file. The heavy lifting is then passed onto the the [Heroku CLI](https://devcenter.heroku.com/articles/heroku-command-line) using commands like `heroku apps:create` to create new dynos.

# Using it

Once the scripts have finished running and heroku has done it's magic, you can start using Parse Server from your app and access Parse Dashboard from your browser.

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

Parse Dashboard requires a username and password when deploying to a server. The username and password for everyone is:

* username: `lighthouse`
* password: `labs`

This information can be changed inside `index.js` line 52 and 53.

# Making Changes

Make all changes on a new feature branch then create a pull request for someone else to merge.

### Testing Changes

* Make sure you have at least Node 4.3. `node --version`
* Clone this repo and change directory to it.
* `npm install`
* Install mongo locally using http://docs.mongodb.org/master/tutorial/install-mongodb-on-os-x/
* Run `mongo` to connect to your database, just to make sure it's working. Once you see a mongo prompt, exit with Control-D
* Run the server with: `npm start`
* By default it will use a path of /parse for the API routes.  To change this, or use older client SDKs, run `export PARSE_MOUNT=/1` before launching the server.
* You now have a database named "dev" that contains your Parse data
* Install ngrok and you can test with devices
