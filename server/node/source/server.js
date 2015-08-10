// a simple variable will store the GCM-ID for now, will be replaced with a database in the future
var tempGcmId = null

var express = require('express')
var app = express()

// print the current GCM-Id to the browser
app.get('/', function (req, res) {
  if (tempGcmId == null)
  {
 	res.send('Id not set!');
  } else {
  	res.send('Id is ' + tempGcmId);
  }

});

// set the current GCM-ID (will override the old one) 
app.get('/setGcmId', function (req, res) {
  var id = req.param('id');
  tempGcmId = id;

  res.send( 'Id set: ' + id );
});

// TODO => create a config file to configure server-port etc.
app.listen(3000)