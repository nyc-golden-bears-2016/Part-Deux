class CreateDecksTable < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string   :category, null: false
      t.references :user, null: false

      t.timestamps(null: false)
    end
  end
end
