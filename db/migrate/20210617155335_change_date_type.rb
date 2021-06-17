class ChangeDateType < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :starting_date
    remove_column :bookings, :ending_date
    add_column :bookings, :starting_date, :date
    add_column :bookings, :ending_date, :date
  end
end
