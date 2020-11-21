class SetNullabillities < ActiveRecord::Migration[5.2]
  def change
    change_column_null :order_entries, :order_id, false
    change_column_null :order_entries, :product_id, false
    change_column_null :order_entries, :quantity, false, 0
    change_column_null :order_entries, :unitprice, false, 0

    change_column_null :orders, :user_id, false
    change_column_null :orders, :totalCost, false, 0

    change_column_null :products, :name, false, "Missing a Name"
    change_column_null :products, :description, false, "No Description Needed"
    change_column_null :products, :stockCount, false, 0
    change_column_null :products, :pricePence, false, 0
    change_column_null :products, :image, false

    change_column_null :reviews, :user_id, false
    change_column_null :reviews, :product_id, false
    change_column_null :reviews, :rating, false
    change_column_null :reviews, :content, false

    change_column_null :sections, :name, false, "Missing a Name"

    change_column_null :users, :firstName, false
    change_column_null :users, :lastName, false
    change_column_null :users, :email, false
    change_column_null :users, :admin, false
    change_column_null :users, :password_digest, false
  end
end
