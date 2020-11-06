class CreateOrderEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :order_entries do |t|
      t.integer :orderID
      t.integer :productID
      t.integer :quantity
      t.integer :unitprice
      t.integer :totalprice

      t.timestamps
    end
  end
end
