class FixReviewScrewup < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :productID
    remove_column :reviews, :userID
    remove_column :reviews, :products_id
    remove_column :reviews, :user_id
    remove_foreign_key :reviews, to_table: :products
    remove_foreign_key :reviews, to_table: :users

    add_column :reviews, :product_id, :integer, index: true
    add_foreign_key :reviews, :products, column: :products_id

    add_column :reviews, :user_id, :integer, index: true
    add_foreign_key :reviews, :users, column: :user_id
  end
end
