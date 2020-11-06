class AddSectionId < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :section, index: true, foreign_key: true
  end
end
