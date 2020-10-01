class CreateSeats < ActiveRecord::Migration[6.0]
  def change
    create_table :seats do |t|
      t.string :number
      t.datetime :booking_date
      t.float :price
      t.belongs_to :flight
      t.belongs_to :passenger, optional: true
      t.timestamps
    end
  end
end
