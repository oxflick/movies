class ChangeYearToDate < ActiveRecord::Migration
  def change
  	change_column :movies, :year, :date
  end
end
