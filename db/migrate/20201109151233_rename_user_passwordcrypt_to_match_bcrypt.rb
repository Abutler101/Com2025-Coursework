class RenameUserPasswordcryptToMatchBcrypt < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :passwordCrypt, :password_digest
  end
end
