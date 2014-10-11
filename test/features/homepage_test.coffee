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

	it "displays a welcome message", ->
		
		expect(browser.text("h1")).to.eql("Welcome to Chitter Node")