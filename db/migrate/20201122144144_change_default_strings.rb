class ChangeDefaultStrings < ActiveRecord::Migration[5.2]
  def change
    change_column_default :products, :name, "Name"
    change_column_default :products, :description, "Description"
    change_column_default :sections, :name, "Name"
  end
end
