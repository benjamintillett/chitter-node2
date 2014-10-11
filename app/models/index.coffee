fs = require("fs")
path = require("path")
Sequelize = require("sequelize")
lodash = require("lodash")
config = require("../../config/config")
db = {}
sequelize = new Sequelize(config.db)
fs.readdirSync(__dirname).filter( (file) ->
  (file.indexOf(".") isnt 0) and (file != "index.coffee")
).forEach (file) ->
	model = sequelize.import(path.join(__dirname, file))
	db[model.name] = model
	return

Object.keys(db).forEach (modelName) ->
  db[modelName].associate db  if "associate" of db[modelName]
  return

module.exports = lodash.extend(
  sequelize: sequelize
  Sequelize: Sequelize
, db)