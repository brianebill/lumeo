== Welcome to Lumeo

Lumeo is a web application created to accelerate learning by capturing the best pros in the world doing what they do.

How to load the database locally:
1. Run the migrations:
	rake db:migrate
2. Load dummy accounts and content: 
    $ bundle exec rake db:reset
	$ bundle exec rake db:populate
	$ bundle exec rake db:test:prepare
3. Add roles to the database at localhost:3000/roles

    