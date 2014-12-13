class AddPermalinksToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :permalink, :string
  end
end
