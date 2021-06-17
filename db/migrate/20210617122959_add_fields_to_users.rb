class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :address, :string
    add_column :users, :we_chat, :string
    add_column :users, :name, :string
  end
end
