express  = require 'express'
router = express.Router()
db = require '../models'


module.exports = (app) ->
  app.use '/', router

router.get '/', (req, res, next) ->

  current_user req, (user) ->

    res.render 'index',
      title: 'Chitter Node',
      user: user

router.post '/users', (req, res, next) ->

	user = db.User.create email: req.body.email, password: req.body.password
    	.complete (err) ->
    		if err
    			console.log('The instance has not been saved:', err)
    		else
    			console.log('We have a persisted instance now')
    			
    	.success (user) ->
    		req.session.user_id = user.id;
    		res.render 'user', title: 'User', user: user



router.post "/session_delete", (req, res, next) ->
	req.session.user_id = null
	res.render 'index',
  		title: 'Chitter Node',
  		user: null

router.get "/sign_in", (req, res,next) ->
  	res.render "sign_in",
  		title: "Chiiter Node"

router.post "/sessions", (req, res,next) ->
	res.render "user",
		title: "User",
		user: null


	

current_user = (request, callback) ->
  db.User.find(request.session.user_id).success (user) ->
    callback user
    