class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :productID
      t.integer :userID
      t.text :content
      t.integer :rating

      t.timestamps
    end
  end
end
