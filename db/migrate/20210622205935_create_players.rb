class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.references :game, foreign_key: true, index: true

      t.timestamps
    end
  end
end
