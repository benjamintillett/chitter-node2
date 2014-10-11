require('coffee-script/register');

express = require('express'),
  config = require('./config/config'),
  db = require('./app/models');

app = express();

require('./config/express')(app, config);

db.sequelize
  .sync()
  .complete(function (err) {
    if(err){
      throw err[0];
    }else{
      app.listen(config.port);
    }
  });

module.exports = app