class ChangeYearToDate < ActiveRecord::Migration
  def change
  	change_column :movies, :year,  'date USING CAST(year AS date)'
  end
end
