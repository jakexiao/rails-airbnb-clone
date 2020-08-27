class AddGuestsNumberToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :guests_number, :integer
  end
end
