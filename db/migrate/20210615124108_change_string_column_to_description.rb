class ChangeStringColumnToDescription < ActiveRecord::Migration[6.0]
  def change
    rename_column :books, :string, :description
  end
end
