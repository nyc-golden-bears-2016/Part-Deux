class CreateCardsTable < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :question, null: false
      t.string :answer, null: false
      t.references :deck, null: false

      t.timestamps(null: false)
    end
  end
end
