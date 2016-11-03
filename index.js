// Example express application adding the parse-server module to expose Parse
// compatible API routes.
'use strict';

const express = require('express');
const ParseServer = require('parse-server').ParseServer;
const path = require('path');

const ParseDashboard = require('parse-dashboard');

const databaseUri = process.env.DATABASE_URI || process.env.MONGODB_URI;

if (!databaseUri) {
  console.log('DATABASE_URI not specified, falling back to localhost.');
}

const appID = process.env.APP_ID || 'myAppId';
const masterKey = process.env.MASTER_KEY || '';
const serverURL = process.env.SERVER_URL || 'http://localhost:1337/parse';
const api = new ParseServer({
  databaseURI: databaseUri || 'mongodb://localhost:27017/dev',
  cloud: process.env.CLOUD_CODE_MAIN || __dirname + '/cloud/main.js',
  appId: appID,
  masterKey: masterKey, //Add your master key here. Keep it secret!
  serverURL: serverURL// Don't forget to change to https if needed
});
// Client-keys like the javascript key or the .NET key are not necessary with parse-server
// If you wish you require them, you can set them as options in the initialization above:
// javascriptKey, restAPIKey, dotNetKey, clientKey

const app = express();

// Serve static assets from the /public folder
app.use('/public', express.static(path.join(__dirname, '/public')));

// Serve the Parse API on the /parse URL prefix
const mountPath = process.env.PARSE_MOUNT || '/parse';
app.use(mountPath, api);

// Dashboard
const dashboard = new ParseDashboard({
  "apps": [
    {
      "serverURL": serverURL,
      "appId": appID,
      "masterKey": masterKey,
      "appName": process.env.USER_NAME || "App"
    }
  ],
  // "users": [
  //   {
  //     "user":"lighthouse",
  //     "pass":"labs"
  //   }
  // ],
  "trustProxy": 1
});

// make the Parse Dashboard available at /dashboard
app.use('/dashboard', dashboard);


// Parse Server plays nicely with the rest of your web routes
app.get('/', function(req, res) {
  res.status(200).send('Welcome to Parse Sever. Now go make some iPhone apps.');
});

// There will be a test page available on the /test path of your server url
// Remove this before launching your app
app.get('/test', function(req, res) {
  res.sendFile(path.join(__dirname, '/public/test.html'));
});

const port = process.env.PORT || 1337;
const httpServer = require('http').createServer(app);
httpServer.listen(port, function() {
  console.log('parse-server running on port ' + port + '.');
});

