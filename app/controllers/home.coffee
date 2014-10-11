express  = require 'express'
router = express.Router()
db = require '../models'


module.exports = (app) ->
  app.use '/', router

router.get '/', (req, res, next) ->

  db.Article.findAll().success (articles) ->
    res.render 'index',
      title: 'Chitter Node'
      articles: articles

