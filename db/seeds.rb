# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first) 
 
places = Place.create([
	{ name: "Crispy Pork Gang", location: "555 Bunk Street" }, 
	{ name: "France", location: "Europe" }, 
	{ name: "Bay City Deli", location: "555 Bunk Street" }])

users = User.create([
	{ username: "Brantb" },
	{ username: "Carolyn"}, 
	{ username: "brandonk"}])

quotes = Quote.create([
	{ quote: "The Amy's Cafe of Thai food", place: places[0] , user: users[0] }, 
	{ quote: "Grey Poupon", place: places[1] , user: users[1] }, 
	{ quote:"It's pretty damn good", place: places[2] , user: users[2] } ])

