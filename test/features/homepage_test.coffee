Browser = require "zombie"
fs = require "fs"
chai = require 'chai'
expect = chai.expect
server = require "../../app"

describe "home page", ->
	browser = null 

	before ->
		@server = server.listen(3001)
		browser = new Browser( site: "http://localhost:3001")

	before (done) ->
		browser.visit("/",done)

	before (done) ->
   		db.User.sync({ force : true }) 
   		done()

	describe "A non signed in user", ->

		it "displays a welcome message", ->
			
			expect(browser.text("h1")).to.eql("Welcome to Chitter Node")

		it 'A new user can sign up form', ->
			browser.
			fill("email", "zombie@underworld.dead").
			fill("password", "eat-the-living").
			pressButton("Sign Me Up!").then ->
				expect(browser.text("h1")).to.eql('User')
				expect(browser.text("h2")).to.eql('zombie@underworld.dead')

		it "a user can sign out", ->
			browser.pressButton("Sign Out").then ->
				expect(browser.query(".user-email")).not.to.eql true


		it "a user can sign in again", ->
			browser.clickLink("Sign In").then ->
				browser.
				fill("email", "zombie@underworld.dead").
				fill("password", "eat-the-living").
				pressButton("Sign in").then ->
					expect(browser.text("h1")).to.eql('User')
					expect(browser.text("h2")).to.eql('zombie@underworld.dead')










	