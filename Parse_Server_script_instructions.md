# Setup a Single Parse Server Instance

## Setup Heroku Environment

* Make sure you have access to the `ios-parse-servers` Lighthouse Labs heroku team. Login to Heroku and see if this team is in your teams list. If it isn't contact sam [sam@lighthouselabs.ca](mailto:sam@lighthouselabs.ca)
* Install the heroku CLI from [https://devcenter.heroku.com/articles/heroku-command-line](https://devcenter.heroku.com/articles/heroku-command-line)

## View and Update Google Sheet

* Make sure you have write access to this [google sheet](https://docs.google.com/spreadsheets/d/1hBRyle189P6GNA8llTylm0mRz0IFAB6G4sDRL5RuXlk/edit?usp=sharing).
* You should always make sure that this sheet is up to date. It is what we share with the students and how everyone knows their app keys and URLs.
* Select the correct cohort's sheet from the bottom of the page. There is a sheet for each location.
* Update your cohort's details by adding a row for each student and making sure the other fields are populated for each student. You can use the `Vancouver` sheet as a reference.
* The `Master Key` and `App ID` are UUIDs. To generate UUIDs within the google sheet, you can use the [Google Sheet UUID Add-on](https://chrome.google.com/webstore/detail/uuid-generator/ckbkeemmekgfdcbbiaamfocoegojpfln?hl=en`). Or if you prefer to generate each key individually and paste it in to the sheet, you can use a [UUID Generator](https://www.guidgenerator.com/online-guid-generator.aspx).

## Get the Scripts

* Make sure you have access to this repo [https://github.com/lighthouse-labs/parse-server-example](https://github.com/lighthouse-labs/parse-server-example)
* Clone or download this repo somewhere. All the scripts we will use are in the `scripts` directory in this repo.

## Create Single Parse Server Instance

Make sure the information in the google sheet is correct before continuing.

The following steps will walk you through how to setup each student's Parse Server instance individually. If you would prefer to generate all the instances at once using the google sheet (prefered), Look at the instructions in the `Parse_Server_from_google_sheet_instructions.md` file.

* Navigate to the `scripts` directory in the `parse-server-example` repo.
* Run the `heroku.sh` script.
* It will ask you for the app name, master key, app id, and students name. Use the values that exist in the google sheet, these must match up exactly.
* Once the script has finished running, you should be able to access the server using the links in the google sheet. You should also be able to modify the server in Heroku.

## Update Single Parse Server Instance 

Do this when you need to update the keys or student's names between cohorts. Updating the servers this way will also wipe the mongo database.

Make sure the information in the google sheet is correct before continuing.

The following steps will walk you through how to update each student's Parse Server instance individually. If you would prefer to modify all the instances at once using the google sheet (prefered), Look at the instructions in the `Parse_Server_from_google_sheet_instructions.md` file.

* Follow the exact instructions you followed when creating the parse server instance. If a server already exists with that name, the script will just update it.

## Access Parse Server

* To access Parse Server from iOS, use the `Server URL` and `App ID`

```swift
Parse.initializeWithConfiguration(ParseClientConfiguration(block: { (configuration: ParseMutableClientConfiguration) -> Void in
  configuration.server = {Server URL from google sheet}
  configuration.applicationId = {App ID from google sheet}
}))
```

* To access Parse Dashbaord, go to link on the student's `Dashboard URL` column. When prompted for a username and password, enter the following credentials:

```
username: lighthouse
password: labs
```






