express  = require 'express'
router = express.Router()
db = require '../models'


module.exports = (app) ->
  app.use '/', router

router.get '/', (req, res, next) ->

  db.Article.findAll().success (articles) ->
    res.render 'index',
      title: 'Chitter Node',
      articles: articles

router.post '/users', (req, res, next) ->
	console.log req.body
	user = db.User.create email: req.body.email, password: req.body.password
    	.complete (err) ->
    		if err
    			console.log('The instance has not been saved:', err)
    		else
    			console.log('We have a persisted instance now')
    			
    	.success (user) ->
    		req.session.user_id = user.id;
    		res.render 'user', title: 'User', user: user
