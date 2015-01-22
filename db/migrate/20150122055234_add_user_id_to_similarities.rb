class AddUserIdToSimilarities < ActiveRecord::Migration
  def change
    add_column :similarities, :user_id, :integer
  end
end
