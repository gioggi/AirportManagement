class CreatePassengers < ActiveRecord::Migration[6.0]
  def change
    create_table :passengers do |t|
      t.string :first_name
      t.string :last_name
      t.string :passport
      t.boolean :on_board, null: false, default: true
      t.belongs_to :user
      t.timestamps
    end
  end
end
