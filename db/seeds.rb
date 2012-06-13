# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 #create role.name admin, free, member
 
 puts 'SETTING UP DEFAULT USER LOGIN'
 user = User.create! :name => 'First User', :email => 'user@example.com', :password => 'password', :password_confirmation => 'password'
 puts 'New user created: ' << user.name
 user2 = User.create! :name => 'Second User', :email => 'user2@example.com', :password => 'password', :password_confirmation => 'password'
 puts 'New user created: ' << user2.name
 user.add_role :admin
 