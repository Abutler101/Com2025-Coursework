class LinkUsersAndReviews < ActiveRecord::Migration[5.2]
  def up
    add_foreign_key :reviews, :users, column: :userID
    add_foreign_key :reviews, :products, column: :productID
  end

  def down
    remove_foreign_key :reviews, column: :userID
    remove_foreign_key :reviews, column: :productID
  end
end
