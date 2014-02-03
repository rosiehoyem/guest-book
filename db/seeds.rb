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

user3 = User.create(name: 'Julia Guilia', location: 'Bemidji', email: 'julia@email.com', password: 'password', password_confirmation: 'password')
user3.messages.build(content: 'You are killing it!')
user3.save

user4 = User.create(name: 'Madonna', location: 'Ohio', email: 'madonna@email.com', password: 'password', password_confirmation: 'password')
user4.messages.build(content: 'I love this! What will be next?')
user4.save

user5 = User.create(name: 'Rob Lowe', location: 'St. Paul', email: 'rob@email.com', password: 'password', password_confirmation: 'password')
user5.messages.build(content: 'Seriously. I do not know what to say.')
user5.save

user6 = User.create(name: 'Kenny Rogers', location: 'Madison', email: 'kenny@email.com', password: 'password', password_confirmation: 'password')
user6.messages.build(content: 'What! This is crap. Start over.')
user6.save