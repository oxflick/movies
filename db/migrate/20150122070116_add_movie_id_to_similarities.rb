class AddMovieIdToSimilarities < ActiveRecord::Migration
  def change
    add_column :similarities, :movie_id, :integer
  end
end
