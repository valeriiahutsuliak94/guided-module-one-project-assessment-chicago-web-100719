class CreateRoles < ActiveRecord::Migration[5.2]
    def change 
        create_table :roles do |t|
            t.string :name
            t.integer :movie_id
            t.integer :actor_id
        end
    end 
end 