class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :actor
      t.text :description
      t.string :picture
      t.string :raiting
      t.string :genre
      
      
      t.timestamps
    end
  end
end
