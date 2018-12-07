This readme file is a working progress while I get the processes in place inside the app

== Welcome to Lumeo

Lumeo is a web application created to accelerate learning by capturing the best pros in the world doing what they do.

How to load the database locally:
1. Run the migrations:
	rake db:migrate
2. Load dummy accounts and content: 
    $ bundle exec rake db:reset
	$ bundle exec rake db:populate
	$ bundle exec rake db:test:prepare
3. Check out the seed data and change the email and passwords to something you can remember.
4. Run: rake db:seed


    