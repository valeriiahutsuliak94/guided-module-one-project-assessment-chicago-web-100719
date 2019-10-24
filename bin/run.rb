require_relative '../config/environment'
def run_app


    def welcome_menu
        puts " Welcome to IMDb app "
    end 

    def main_menu
        puts "Please choose from the main menu"
        puts "s for movie search"
        puts "c to create a movie"
        puts "u for movie update"
        puts "d to delete a movie"
        puts "a list of the movie names in ascending order"
        puts "z list of the movie names in descending order"
        puts "g for search by genre"
        puts "f for find movie by actor name"
        puts "l for find actor what plain in a movie"
        puts "p for the top 5 movies"
        puts "t for to 5 actors"
        puts "q for exit"
        gets.chomp
    end

    welcome_menu
    user_response = main_menu
    
    while user_response != "q"
        case user_response
        when "s"
            puts `clear`
            puts "Please enter the name of the movie you would like to search"
            search_response = gets.chomp
            puts Movie.search_movie(search_response)
            puts "The movie #{search_response.capitalize} is in our app!"
            user_response = main_menu
        when "c" 
            puts `clear`
            puts "Please write a name of a movie you would like to create"
            name_answer = gets.chomp
            puts "Please enter the name of a director for this movie"
            director_answer = gets.chomp
            puts "Please enter a genre of this movie"
            genre_answer = gets.chomp
            puts "Please enter the year this movie was released"
            year_answer = gets.chomp
            Movie.create(name: name_answer, director: director_answer, genre: genre_answer, year: year_answer)
            puts "Thank you for updating our app by adding a new movie!"
            user_response = main_menu
        when "u" 
            puts `clear`
            puts "What movie would you like to update?"
            response = gets.chomp 
            movie_to_update = Movie.find_by(name: response)
            puts "What type of information would you like to update for this movie?"
            update_category = gets.chomp 
            puts "What would you like the new #{update_category} to be?"
            new_update = gets.chomp
            movie_to_update.update(update_category => new_update)
            puts "Thank you for the movie update" 
            user_response = main_menu
        when  "d" 
            puts `clear`
            puts "Which movie would you like to delete?"
            response = gets.chomp
            delete_movie = Movie.find_by(name: response)
            delete_movie.destroy 
            puts "The movie was successfully deleted"
            user_response = main_menu
        when "t"
             top = Actor.all.max_by(5) do |actor|
             actor.movies.count
            end 
            top_name = top.map do |actor|
                actor.name
            end 
            puts "There is a top 5 actors in our app #{top_name.join(', ')}"
            user_response = main_menu
        when "p"
            top = Movie.all.max(5) do |movie|
                movie.actors.count
            end 
            top_name = top.map do |movie|
                movie.name
            end 
            puts "There is a top 5 movies in our app #{top_name.join(', ')}"
            user_response = main_menu
            
        when "a" 
            puts `clear`
            puts "Please see our list of movies"
            order_movie = Movie.order(:name)
            order_movie.each do |movie| 
            puts movie.name
            end
            user_response = main_menu
    
        when "z" 
            puts `clear`
            puts "Please see our list of movies"
            order_movie = Movie.order('id ASC').reorder('name DESC')
            order_movie.each do |movie|
            puts movie.name
            end 
            user_response = main_menu
        when "f"
            puts "Please enter name of the actor"
            user_input = gets.chomp
            find_by_actor = Actor.all.find_by(name: user_input)
            search_movie = find_by_actor.movies.map do |movie|
            movie.name
            end 
            puts "This a list of movie where this actor #{search_movie.join (', ')} are plaing"
            # p find_by_actor.movies
            user_response = main_menu
        when "l"
            puts "name of movie"
            user_input = gets.chomp
            find_by_movie = Movie.all.find_by(name: user_input)
            search_actor = find_by_movie.actors.map do |actor|
            actor.name
            end 
            puts "This a list of actors  #{search_actor.join (', ')} are plaing in this movie"
            user_response = main_menu
        when "g" 
            # puts `clear`
            puts "Please enter genre of the movie"
            user_input = gets.chomp
            puts "Please see the list of movies in this genre:"
            find_by_genre = Movie.all.where("genre = ?", user_input) #where genre: user_input dont work
            puts find_by_genre.map {|movie| movie.name}   
            #  p find_by_genre[0].name
            # movie
            #  puts "Please see the list of movies in this genre: #{find_by_genre[0].name}"   
            end
            
       
        end 
        puts `clear`
        puts "Have a Good Day!!!"
end


     run_app






# def main_screen 
#     puts""
#     puts""
#     puts """""""""""""""""""""Welcome to IMDb"""""""""""""""""""""""""
#     puts""
#     puts""
#     puts "s for search movie"
#     puts "c for create movie"
#     puts "u for update movie"
#     puts "d for delete movie"
#     puts "a list of the movie (A..Z)"
#     puts "z list of the movie (Z..A)"
#     puts "g for search by genre"
#     puts "q for exit"
#     puts "m for main menu"
#     user_input = gets.chomp
#     # puts "#{user_input}"

#     case  user_input
#     when 's' then
#         puts " What movie you want to search?"
#         search_response = gets.chomp
#         puts Movie.search_movie(search_response)
#         puts "The movie #{search_response.capitalize} is in our app!"

#         main_screen
#     when 'c' then
#         puts "What a name movie you want to create?"
#         name_answer = gets.chomp
#         puts "What a name of director in this movie?"
#         director_answer = gets.chomp
#         puts "What a genre of this movie?"
#         genre_answer = gets.chomp
#         puts "What a year of this movie?"
#         year_answer = gets.chomp
#         Movie.create(name: name_answer, director: director_answer, genre: genre_answer, year: year_answer)

#         main_screen
#     when 'u' then
#         puts "What movie  you want to update?"
#         response = gets.chomp
#         puts `clear`
#         movie_to_update = Movie.find_by(name: response)
#         puts "What you want to update in this movie?"
#         update_category = gets.chomp 
#         puts `clear`
#         puts "What do you want the new #{update_category} to be?"
#         new_update = gets.chomp
#         puts `clear`
#         movie_to_update.update(update_category => new_update) 

#         main_screen
#     when  'd' then
#         puts "What movie you wold like to delete?"
#         response = gets.chomp
#         delete_movie = Movie.find_by(name: response)
#         delete_movie.destroy 
        
#         main_screen
       
#     when 'a' then
#         puts `clear`
#         order_movie = Movie.order(:name)
#         order_movie.each do |movie| 
#         puts movie.name

#         end 

#     main_screen
#     when 'z' then
#         order_movie = Movie.order('id ASC').reorder('name DESC')
#         order_movie.each do |movie|
#         puts movie.name
        
#         end 
#         main_screen
        
#     when 'g' then
#         puts "Please enter genre"
#         user_input = gets.chomp
#         find_by_genre = Movie.all.where genre: user_input
#         # find_by_genre.map {|movie| movie.genre}      
#         p find_by_genre
#         puts "Here sre the movies in this genre: #{find_by_genre.name}"   
      
#         main_screen
#     when 'm' then 
#         puts "s for search movie"
#         puts "c for create movie"
#         puts "u for update movie"
#         puts "d for delete movie"
#         puts "a list of the movie (A..Z)"
#         puts "z list of the movie (Z..A)"
#         puts "g for search by genre"
#         puts "q for exit"
#         puts "m for main menu"
#         user_input = gets.chomp
#         # puts "#{user_input}"
        
    
    
#     when 'q' then
#         exit
#     else 
#         puts "Dont match any of answers"
    
#     end  
# end 




# main_screen 




#As a user, I want to find a movie (Reader)

#As a user, I want to create a new movie, so that will 
#create and save a new movie(Create)

#As a user, I want to update and save my movie.

#As a user, I want to be able to  delete my movie.

#I want to be aible print list with all movie ASC




    # elsif response == 'name'
    #         puts "Please enter new name"
    #         name_update = gets.chomp
    #         .update(name: name_update)
    #     elsif response == 'director'
    #         puts "Please enter new director"
    #         director_update = gets.chomp
    #         .update(director: director_update)
    #     elsif response == 'genre'
    #         puts "Please enter new genre"
    #         genre_updsate = gets.chomp
    #         movie_to_update.update(genre: genre_update)
    #      else response == 'year'
    #         puts "Please enter new year"
    #         year_update = gets.chomp
    #         Movie.update(year: year_update)
    #     end 
    #  end 
    # def delete_movie