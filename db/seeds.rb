# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(email: 'mrs@gmail.com', password: 'hellothere', role: 'editor')
User.create!(email: 'misses@gmail.com', password: 'goodbye1', role: 'visitor')
User.create!(email: 'mister@gmail.com', password: 'password', role: 'author')

Post.create!(title: "Ironman Returns", content: "Superheros are awesome!")
