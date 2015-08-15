class AddUrlToSimilarities < ActiveRecord::Migration
  def change
    add_column :similarities, :url, :string
  end
end
