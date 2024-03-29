class CreateRoundsTable < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.references :user, null: false
      t.references :deck, null: false
      t.integer :total_guesses,  default: 0
      t.integer :correct_guesses, default: 0

      t.timestamps(null: false)
    end
  end
end
