class RemoveStringDefaults < ActiveRecord::Migration[5.2]
  def change
    change_column_default :products, :name, nil
    change_column_default :products, :description, nil
    change_column_default :sections, :name, nil
  end
end
