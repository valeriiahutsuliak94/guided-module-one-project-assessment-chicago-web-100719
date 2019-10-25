require_relative '../config/environment'
def run_app


    def welcome_menu
        puts "
                   
    WW      WW        lll                                     tt              
    WW      WW   eee  lll   cccc  oooo  mm mm mmmm    eee     tt     oooo     
    WW   W  WW ee   e lll cc     oo  oo mmm  mm  mm ee   e    tttt  oo  oo    
     WW WWW WW eeeee  lll cc     oo  oo mmm  mm  mm eeeee     tt    oo  oo    
      WW   WW   eeeee lll  ccccc  oooo  mmm  mm  mm  eeeee     tttt  oooo     



      IIIII MM    MM DDDDD   BBBBB                                        
       III  MMM  MMM DD  DD  BB   B       aa aa pp pp   pp pp             
       III  MM MM MM DD   DD BBBBBB      aa aaa ppp  pp ppp  pp           
       III  MM    MM DD   DD BB   BB    aa  aaa pppppp  pppppp            
      IIIII MM    MM DDDDDD  BBBBBB      aaa aa pp      pp                
                                                pp      pp                

                                                                                                                             

        "
    end 

    def main_menu
        puts "============Please choose from the main menu============\n\n"
        puts " 1 for movie search\n\n 2 to create a movie\n\n 3 for movie update\n\n 4 to delete a movie\n\n 5 list of the movie names in ascending order\n\n 6 list of the movie names in descending order\n\n 7 for search by genre\n\n 8 to find movie by actor name\n\n 9 to find a list of actors that are in the movie\n\n 10 for the top 5 movies\n\n 11 for to 5 actors\n\n q for exit\n\n"
        gets.chomp
    end

    welcome_menu
    user_response = main_menu
    
    while user_response != "q"
        case user_response
        when "1"
            puts `clear`
            puts "Please enter the name of the movie you would like to search"
            search_response = gets.chomp
            search_by_movie = Movie.where name: search_response
            if search_by_movie.length > 0
            puts "The movie is in our app:"
            puts "#{search_by_movie[0][:name]}"
            puts "#{search_by_movie[0][:director]}"
            puts "#{search_by_movie[0][:genre]}"
            puts "#{search_by_movie[0][:year]}"
        else 
            puts "Sorry, no movie by this name exist"
        end 
            user_response = main_menu
        when "2" 
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
        when "3" 
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
        when  "4" 
            puts `clear`
            puts "Which movie would you like to delete?"
            response = gets.chomp
            delete_movie = Movie.find_by(name: response)
            delete_movie.destroy 
            puts "The movie was successfully deleted"
            user_response = main_menu
        when "11"
            puts `clear`
             top = Actor.all.max_by(5) do |actor|
             actor.movies.count
            end 
            top_name = top.map do |actor|
                actor.name
            end 
            puts "Top 5 actors in our app #{top_name.join(', ')}"
            user_response = main_menu
        when "10"
            puts `clear`
            top = Movie.all.max(5) do |movie|
                movie.actors.count
            end 
            top_name = top.map do |movie|
                movie.name
            end 
            puts "Top 5 movies in our app #{top_name.join(', ')}"
            user_response = main_menu
            
        when "5" 
            puts `clear`
            puts "Please see our list of movies"
            order_movie = Movie.order(:name)
            order_movie.each do |movie| 
            puts movie.name
            end
            user_response = main_menu
    
        when "6" 
            puts `clear`
            puts "Please see our list of movies"
            order_movie = Movie.order('id ASC').reorder('name DESC')
            order_movie.each do |movie|
            puts movie.name
            end 
            user_response = main_menu
        when "8"
            puts `clear`
            puts "Please enter name of the actor"
            user_input = gets.chomp
            find_by_actor = Actor.all.find_by(name: user_input)
            if find_by_actor
               search_movie = find_by_actor.movies.map do |movie|
               movie.name
            end 
            puts "This a list of movie: #{search_movie.join (', ')} where this actor are plaing"
        else 
            puts "Soory, we did not find any movie by this actor name"
        end 
            user_response = main_menu
        when "9"  
            puts `clear`
            puts "Please enter name of the movie"
            user_input = gets.chomp
            find_by_movie = Movie.all.find_by(name: user_input)
            if find_by_movie
                search_actor = find_by_movie.actors.map do |actor|
                actor.name
                end 
                puts "This a list of actors  #{search_actor.join (', ')} are playing in this movie"
            else
                puts "Sorry, we did not find any actors by this movie"
            end 
                user_response = main_menu  
        when "7" 
            puts `clear`
            puts "Please enter genre of the movie"
            user_input = gets.chomp
            find_by_genre = Movie.all.where("genre = ?", user_input) #where genre: user_input dont work
            if find_by_genre.length > 0
               serch_genre = find_by_genre.map {|movie| movie.name}
               puts "Please see the list of movies in this genre:" 
               puts serch_genre 
            else
                puts "Sorry, we did not find any movie in this genre"
            end
            user_response = main_menu 
        else 
            puts "Error: user_responce has an invalid value (#{user_response})"
            user_response = main_menu 
        end 

            
    end 
    puts "Have a Good Day!!!"
end


     run_app






    # puts "Please enter name of the movie"
            # user_input = gets.chomp
            # find_by_movie = Movie.all.find_by(name: user_input)
            # if find_by_movie
            #    search_actor = find_by_movie.actors.map do |actor|
            #    actor.name
            #    puts "This a list of actors  #{search_actor} are playing in this movie"
            # end 
            # else
            #    puts "Sorry, this actor did not play in this movie"
            # end 
            # user_response = main_menu  


    # puts "Please enter name of the actor"
            # user_input = gets.chomp
            #  if find_by_actor = Actor.all.find_by(name: user_input)
            # # if find_by_actor
            #     search_movie = find_by_actor.movies.map do |movie|
            #     search_movie.name
            #     # puts "This a list of movie where this actor #{search_movie} are plaing"
            #     end
            # else
            #     puts "Sorry, no movies by that actor exists."
            # end 
            # user_response = main_menu

                 # search_actor = find_by_movie.actors.map do |actor|
            # actor.name
            # end 
            # puts "This a list of actors  #{search_actor.join (', ')} are plaing in this movie"
            # user_response = main_menu