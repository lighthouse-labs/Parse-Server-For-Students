# Setup a Multiple Parse Server Instances

Before you continue, make sure you have read the following sections in the `Parse_Server_script_instructions.md` file:

* Setup Heroku Environment
* View and Update Google Sheet
* Get the Scripts

## Download CSV and Run Script

Make sure the information in the google sheet is correct and you are on the correct sheet for your cohort before continuing. These are same instructions for creating new server instances, or updating existing servers. Remember that this will update all servers in the csv file and create new mongodb instance, so all saved data will be lost. This is ideal for updating servers for different cohorts, but would not be ideal to run in the middle of a cohort.

* Navigate to `File > Download as > Comma-seperated values (.csv current sheet)` to download the current google sheet as a csv file.

![Imgur](http://i.imgur.com/n1iRPYu.png)

* Navigate to the `scripts` directory and run the `./heroku-csv.sh` script and pass in the downloaded csv file.

![Imgur](http://i.imgur.com/QD3CN99.png) 

* You should now see the ouput of the script creating or updating the heroku servers.

## Access Parse Server

Read the Access Parse Server section in the `Parse_Server_script_instructions.md` file.