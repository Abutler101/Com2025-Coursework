class SetDefaults < ActiveRecord::Migration[5.2]
  def change
    change_column_default :order_entries, :quantity, 0
    change_column_default :order_entries, :unitprice, 0

    change_column_default :orders, :totalCost, 0

    change_column_default :products, :name, "Missing a Name"
    change_column_default :products, :description, "No Description Needed"
    change_column_default :products, :stockCount, 0
    change_column_default :products, :pricePence, 0

    change_column_default :sections, :name, "Missing a Name"

  end
end
