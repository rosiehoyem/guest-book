# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(name: 'Jane Doe', location: 'Copenhagen', email: 'jane@email.com', password: 'password', password_confirmation: 'password')
user1.messages.build(content: 'This is great, tell me more.')
user1.save

user2 = User.create(name: 'John Doe', location: 'Chicago', email: 'john@email.com', password: 'password', password_confirmation: 'password')
user2.messages.build(content: 'What! This is crap. Start over.')
user2.save