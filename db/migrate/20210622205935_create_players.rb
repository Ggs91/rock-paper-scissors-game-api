class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.string :move, null: false
      t.references :game, foreign_key: true, index: true
      t.references :won_game, index: true

      t.timestamps null: false
    end
  end
end
