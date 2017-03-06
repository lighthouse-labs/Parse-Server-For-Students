# Delete a Single Parse Server Instance

## Setup Heroku Environment

* Make sure you have access to the `ios-parse-servers` Lighthouse Labs heroku team. Login to Heroku and see if this team is in your teams list. If it isn't contact sam [sam@lighthouselabs.ca](mailto:sam@lighthouselabs.ca)
* Install the heroku CLI from [https://devcenter.heroku.com/articles/heroku-command-line](https://devcenter.heroku.com/articles/heroku-command-line)

## Google Sheet

* Make sure you have write access to this [google sheet](https://docs.google.com/spreadsheets/d/1hBRyle189P6GNA8llTylm0mRz0IFAB6G4sDRL5RuXlk/edit?usp=sharing).
* You should always make sure that this sheet is up to date. It is what we share with the students and how everyone knows their app keys and URLs.
* Select the correct cohort's sheet from the bottom of the page. There is a sheet for each location.
* You will be removing each student from the sheet as you delete the dyno.

## Get the Scripts

* Make sure you have access to this repo [https://github.com/lighthouse-labs/parse-server-example](https://github.com/lighthouse-labs/parse-server-example)
* Clone or download this repo somewhere. All the scripts we will use are in the `scripts` directory in this repo.

## Remove Server

* Navigate to the `scripts` directory in the `parse-server-example` repo.
* Run the `heroku-destroy.sh` script. You will have to run this once for each student.
* It will ask you for the app name, use the values that exist in the google sheet, these must match up exactly.
* Once the script has finished running, you should remove the student from the google sheet.