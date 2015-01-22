class CreateSimilarities < ActiveRecord::Migration
  def change
    create_table :similarities do |t|
      t.string :image
      t.string :name
      t.string :actor
      t.string :why

      t.timestamps
    end
  end
end
