class ChangeYearToDatetime < ActiveRecord::Migration
  def change
  	change_column :movies, :year, :datetime
  end
end
