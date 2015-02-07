class AddPublishToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :publish, :boolean, default: false
  end
end
