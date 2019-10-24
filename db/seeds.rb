require 'faker'

10.times do 
    Actor.create(name: Faker::Name.name, 
    birthday: Faker::Date.birthday(min_age: 18, max_age: 95))
    Movie.create(name: Faker::Book.title, director: Faker::Book.author, genre: Faker::Book.genre, year: rand(1960..2019) )

end 
10.times do
    Role.create(name: Faker::Movies::BackToTheFuture.character, actor_id: rand(1..10), movie_id: rand(1..10))
end 
