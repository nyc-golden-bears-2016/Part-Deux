class CreateGuessesTable < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.references :rounds, null: false
      t.references :users, null: false
      t.references :cards, null: false
      t.string :content, null: false
      t.boolean :correct, null: false

      t.timestamps(null: false)
    end
  end
end
