class ChangeWhyToText < ActiveRecord::Migration
  def change
  	change_column :similarities, :why, :text
  end
end
