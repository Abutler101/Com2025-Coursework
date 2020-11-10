class CorrectOrderEntriesColumnNames < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_entries, :productID
    remove_column :order_entries, :orderID
    remove_column :order_entries, :products_id
    remove_column :order_entries, :orders_id
    remove_foreign_key :order_entries, to_table: :products
    remove_foreign_key :order_entries, to_table: :orders

    add_column :order_entries, :product_id, :integer, index: true
    add_foreign_key :order_entries, :products, column: :products_id

    add_column :order_entries, :order_id, :integer, index: true
    add_foreign_key :order_entries, :orders, column: :order_id
  end
end
