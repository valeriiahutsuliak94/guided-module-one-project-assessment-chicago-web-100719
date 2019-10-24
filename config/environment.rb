require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
ActiveRecord::Base.logger = nil

#As a user, I want to enter amovie name,
# so that show list of actors(Reader)

#As a user, I want to enter a actor name, so that show
#a list of movie that actor played a role in (Reader)

#As a user, I want to create a new movie, so that will 
#create and save a new movie(Create)

#As a user, I want to update and save my movie.

#As a user, I can delete my movie.

#As a user, I can define by actors name list of movie (.all.select do ||)
