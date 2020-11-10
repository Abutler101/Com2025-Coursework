class FixLinkBetweenOrdersAndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :user_id, :integer, index: true
    add_foreign_key :orders, :users, column: :user_id
  end
end
