class Movie < ActiveRecord::Base
    has_many :roles
    has_many :actors,through: :roles

    def self.search_movie(search_response)
        search_movie = Movie.find_by(name: search_response)
        "#{search_movie.name}, #{search_movie.director}"
    end 
    
    def self.test_fun 
        puts "This test_fun has been run"
    end 

    def update_movie(name_update, director_update, genre_update, year_update)
        Movie.update(name: name_update, director: director_update, genre: genre_update, year: year_update)
    end

    def self.update(name: name_update)
        if movie.update(response)
            redirect_to @movie
        else
            render 'edit'
        end 
     def genre=(genre)
            @genre = genre
            self.genre.add_movie(self)
    end 
    def actor_movie
        actor_movie = Actor.first
        actor.movie.collect {|a| a.role}.compact
        actor_movie.role
        end
    end 
end 

